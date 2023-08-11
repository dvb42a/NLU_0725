from django.shortcuts import render

from django.views.generic.base import View
import shutil, logging, config
from Accounts.required import login_required, get_user_info
from Accounts.models import MainAccount
from Order.models import Order
from Client.models import ClientPlan
from Apps.models import Apps
from app.views import sendconfig
from Order.form import CreateForm
from django.utils import timezone
from django.db.models import Count

class app(View):
    @staticmethod
    @login_required
    def get(request, context):
        account = get_user_info(request)
        clientPlan=ClientPlan.objects.filter(ac=account.ac_name)
        clientPlanCount=clientPlan.count()
        client_plan_withCountApp = clientPlan.annotate(current_app=Count('plan_app'))
        context['account']=account
        context['clientPlan']=client_plan_withCountApp
        context['clientPlanCount']=clientPlanCount
        context.update(dict(
            dashborad=True
        ))
        return render(request, 'Client/editApp.html', sendconfig(context,request))

class app_index(View):

    @staticmethod
    def get(request, id):
        context={}
        clientPlan = ClientPlan.objects.select_related('order').get(id=id)
        account = get_user_info(request)
        order=Order.objects.filter(order_no=clientPlan.order_id)

        mission_data = Apps.objects.filter(ac_id=account , plan_id=id)
        context['clientPlan']=clientPlan
        context['account'] = account
        context['mission_data']=mission_data
        context.update(dict(
            dashborad=True
        ))
        return render(request, 'Client/indexApp.html',  sendconfig(context,request))



class member(View):

    @staticmethod
    @login_required
    def get(request, context):
        print('456')

class order(View):

    @staticmethod
    @login_required
    def get(request,context):
        account = get_user_info(request)
        clientPlan = ClientPlan.objects.filter(ac=account.ac_name)
        clientPlanCount = clientPlan.count()
        order = Order.objects.filter(ac_id=account.ac_name).order_by('-order_time')
        context['orders'] = order
        context['account'] = account
        context['clientPlan'] = clientPlan
        context['clientPlanCount'] = clientPlanCount
        context.update(dict(
            dashborad=True
        ))

        return render(request, 'Client/editOrder.html',  sendconfig(context,request))


class order_index(View):
    @staticmethod
    def get(request, id):
        context = {}
        account = get_user_info(request)
        order_data = Order.objects.get(order_no=id)
        context['account'] = account
        context['order'] = order_data
        context['form'] = CreateForm(instance=order_data)
        context.update(dict(
            dashborad=True
        ))
        return render(request, 'Client/indexOrder.html', sendconfig(context, request))

    @staticmethod
    def post(request,id):

        context = {}
        order_data = Order.objects.get(order_no=id)
        form = CreateForm(request.POST or None, instance=order_data)
        if form.is_valid():
            form.save()
            order_data.status=1
            order_data.client_submit_time = timezone.now()
            order_data.save()

            if request.POST['saveInfo'] == 'on' :
                try:
                    account_info=MainAccount.objects.get(ac_id=order_data.ac_id)
                    account_info.transfer_name = request.POST['name']
                    account_info.bank_account = request.POST['bankaccount']
                    account_info.phone_number = request.POST['phone_number']
                    account_info.save()
                except MainAccount.DoesNotExist:
                    new_account_info=MainAccount(
                        ac_id = order_data.ac_id,
                        transfer_name= request.POST['name'],
                        bank_account = request.POST['bankaccount'],
                        phone_number = request.POST['phone_number']
                    )
                    new_account_info.save()

            context['form'] = CreateForm(instance=order_data)
        else:
            context['form']=form
        account = get_user_info(request)
        order_data = Order.objects.get(order_no=id)
        context['account'] = account
        context['order'] = order_data
        context.update(dict(
            dashborad=True
        ))
        return render(request, 'Client/indexOrder.html', sendconfig(context, request))


