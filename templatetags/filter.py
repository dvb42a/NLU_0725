from datetime import datetime
from django import template
from Plan.models import Plan

register = template.Library()

@register.filter
def days_until(date):
    try:
        delta = datetime.date(date) - datetime.now().date()
        if delta.days <= 0 :
            return "已過期"
        else:
            return "剩餘{days}天" .format(days=delta.days)
    except:
        return "查無日期"

@register.filter
def show_date(date):
    try:
        date_string = date.strftime('%Y-%m-%d %H:%M:%S')
        return date_string
    except:
        return "查無日期"

@register.filter
def show_short_date(date):
    try:
        date_string = date.strftime('%Y%m%d')
        return date_string
    except:
        return "查無日期"

@register.filter
def minus(value, arg):
    return value - arg

@register.filter
def displayAppCount(value,arg):
    return arg-value

@register.filter
def displayPlanName(value):
    plan_data=Plan.objects.get(plan_id=value)
    return plan_data.plan_name
