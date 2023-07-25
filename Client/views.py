from django.shortcuts import render

from django.views.generic.base import View

from Accounts.required import login_required, get_user_info
from Order.models import Order
from Client.models import ClientPlan
from Apps.models import Apps

class app(View):
    @staticmethod
    @login_required
    def get(request, context):
        account = get_user_info(request)
        clientPlan=ClientPlan.objects.filter(ac=account.ac_id)
        clientPlanCount=clientPlan.count()
        context['account']=account
        context['clientPlan']=clientPlan
        context['clientPlanCount']=clientPlanCount
        return render(request, 'Client/editApp.html',context)

class app_index(View):

    @staticmethod
    def get(request, id):
        context={}
        clientPlan=ClientPlan.objects.select_related('order').get(cplan_id=id)
        account = get_user_info(request)
        mission_data =  Apps.objects.filter(ac_id=account.ac_id , cplan_id=id)
        context['clientPlan']=clientPlan
        context['account'] = account
        context['mission_data']=mission_data
        return render(request, 'Client/indexApp.html', context)



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
        clientPlan = ClientPlan.objects.filter(ac=account.ac_id)
        clientPlanCount = clientPlan.count()
        order = Order.objects.filter(ac_id=account.ac_id).order_by('-order_time')
        context['orders'] = order
        context['account'] = account
        context['clientPlan'] = clientPlan
        context['clientPlanCount'] = clientPlanCount
        return render(request, 'Client/editOrder.html', context)

class order_index(View):
    @staticmethod
    def get(request, id):
        context = {}
        account = get_user_info(request)
        order_data = Order.objects.get(order_no=id)
        context['account'] = account
        context['order_data'] = order_data
        return render(request, 'Client/indexOrder.html', context)
