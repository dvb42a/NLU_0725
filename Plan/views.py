from django.shortcuts import render
from django.views.generic.base import View
from django.http import HttpResponseRedirect, StreamingHttpResponse, JsonResponse
from Accounts.required import (
    login_required
)
from django.shortcuts import redirect
from django.contrib import messages
from Plan.form import CreateForm
from Plan.models import Plan
from django.utils import timezone

class IndexView(View):

    @staticmethod
    @login_required
    def get(request, context):
        form = CreateForm()
        plan_list = list(Plan.objects.all().order_by('plan_pay'))
        return render(request, 'Admin/plan_manage.html', {'form': form, 'plan_list': plan_list})

    @staticmethod
    @login_required
    def post(request, context):
        form = CreateForm(request.POST)
        plan_list = list(Plan.objects.all().order_by('plan_pay'))
        if form.is_valid():
            plan_name = request.POST['plan_name']
            try:
                user = Plan.objects.get(plan_name=plan_name)
                ret = {'form': form, 'message': "此方案名稱已存在", 'plan_list':plan_list}
                return render(request, 'Admin/plan_manage.html', ret)
            except Plan.DoesNotExist:

                new_plan = Plan(
                    plan_name=request.POST['plan_name'],
                    plan_pay=request.POST['plan_pay'],
                    plan_app=request.POST['plan_app'],
                    plan_person=request.POST['plan_person'],
                    plan_employee=request.POST['plan_employee'],
                    plan_file=request.POST['plan_file'],
                    plan_count=request.POST['plan_count'],
                    expired_at=request.POST['expired_at'],
                )
                new_plan.save()
                form = CreateForm()
                re_plan_list = list(Plan.objects.all())
                ret = {'form': form, 'plan_list': re_plan_list}
                print(new_plan.plan_id)
                return render(request, 'Admin/plan_manage.html', ret)
        else:
            ret = {'form': form, 'message': "There are some error ", 'plan_list':plan_list}
            return render(request, 'Admin/plan_manage.html', ret)

class EditView(View):
    @staticmethod
    def get(request,id ):
        plan = Plan.objects.get(pk=id)
        context = {'form': CreateForm(instance=plan), 'id':id}
        return render(request, 'Admin/plan_edit.html', context)
    @staticmethod
    def post(request,id):
        plan = Plan.objects.get(plan_id=id)
        form = CreateForm(request.POST or None, instance=plan)
        context = {'form': form, 'id': id}
        if form.is_valid():
            form.save()
            plan.updated_at = timezone.now()
            plan.save()
            context = {'form': form, 'id': id, 'message': "更新完成!"}
        return render(request, 'Admin/plan_edit.html', context)
