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
from django.core.paginator import Paginator
from django.db.models import Q

class app(View):
    @staticmethod
    @login_required
    def get(request, context):
        account = get_user_info(request)
        search_input = ""

        page = request.GET.get('page')
        if 'search' in request.GET:
            search = request.GET['search']
            plan_list = ClientPlan.objects.filter(
                Q(plan_name__contains=search)).order_by('-plan_start')
            plan_list= plan_list.filter(ac=account.ac_name)
            search_input = search
        else:
            plan_list = ClientPlan.objects.filter(ac=account.ac_name).order_by('-plan_start')
        client_plan_withCountApp = plan_list.annotate(current_app=Count('plan_app'))
        plan = Paginator(client_plan_withCountApp, 5)
        plan = plan.get_page(page)

        clientPlanCount=plan_list.count()


        context['search_input'] = search_input
        context['account']=account
        context['clientPlan']=plan
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
    def get(request, context):
        account = get_user_info(request)

        search_input = ""
        if 'search' in request.GET:
            search = request.GET['search']

            order_querysetNotFilter = Order.objects.filter( Q(order_no__contains=search)
                                                | Q(phone_number__contains=search) | Q(bankaccount__contains=search) | Q(name__contains=search))
            order_queryset = order_querysetNotFilter.filter(ac_id= account.ac_name)
            search_input = search
        elif 'status' in request.GET:
            order_querysetNotFilter = Order.objects.filter(Q(status=request.GET['status']))
            order_queryset = order_querysetNotFilter.filter(ac_id=account.ac_name)
        else:
            order_queryset = Order.objects.filter(ac_id=account.ac_name).order_by('-order_time')

        paginator = Paginator(order_queryset, 5)
        order_page = request.GET.get('page')
        orders = paginator.get_page(order_page)

        context['orders'] = orders
        context['account'] = account
        context['search_input'] = search_input
        context.update(dict(
            dashborad=True
        ))
        return render(request, 'Client/editOrder.html', sendconfig(context, request))

class order_index(View):
    @staticmethod
    def get(request, id):
        context = {}
        account = get_user_info(request)
        order_data = Order.objects.get(order_no=id)
        inputHistory = MainAccount.objects.get(ac_id = account.ac_name)
        context['account'] = account
        context['order'] = order_data
        context['form'] = CreateForm(instance=order_data)
        context['inputHistory']=inputHistory
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

            if 'saveInfo' in request.POST:
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


