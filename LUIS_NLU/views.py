from django.shortcuts import render
from Plan.models import Plan
from Accounts.required import get_user_info

def Homepage(request):
    plan_list = list(Plan.objects.all().order_by('plan_price'))
    ret={}
    if request.session.get('is_login', None):
        account = get_user_info(request)
        ret['account'] = account
    ret['plan_list'] = plan_list
    return render(request, 'home.html' ,ret)