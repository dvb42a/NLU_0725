from django.shortcuts import render, redirect
from django.views.generic.base import View
from Accounts.required import login_required
from Order.models import Order
from Plan.models import Plan
from django.utils.crypto import get_random_string
from Accounts.required import get_user_info
import datetime


class create_order(View):
    @staticmethod
    @login_required
    def get(request, context, plan=None):
        if'plan' in request.GET:
            plan = Plan.objects.filter(plan_name= request.GET['plan']).first()
            context['plan']=plan
        return render(request, 'order/order.html',context)
    @staticmethod
    @login_required
    def post(request, context):

        plan = Plan.objects.filter(plan_name=request.GET['plan']).first()
        #creating the order number
        year = datetime.date.today().year
        month = datetime.date.today().month
        day = datetime.date.today().day
        random = get_random_string(length=8)
        order_no = str(year)+str(month)+str(day)+random

        user = get_user_info(request)
        userid = user.ac_name

        new_order = Order(
            order_no=order_no,
            ac_id=userid,
            status="0",
            plan_id=plan.plan_id,
            price=plan.plan_price,
            order_time =datetime.datetime.now()
        )
        new_order.save()
        order_details = new_order

        return redirect('Order:order_submit', id=order_details.order_no)

class receipt(View):
    @staticmethod
    def get(request,id):
        order = Order.objects.get(order_no=id)
        plan = Plan.objects.get(plan_id = order.plan_id)
        expired_date = order.order_time+ datetime.timedelta(days=3)
        context = {'order': order, 'plan': plan,'expired_date':expired_date}
        return render(request, 'order/receipt.html', context)