from django.shortcuts import render
from django.views.generic.base import View
from Accounts.forms import VerifyForm,NewPasswordForm
from datetime import timedelta
from Accounts.models import Account
from django.core.mail import send_mail
from django.conf import settings
import hmac, hashlib, base64, datetime
from django.utils.html import format_html
import config,re
from Client.models import ClientPlan
from Plan.models import Plan
from django.utils.crypto import get_random_string
from django.utils import timezone
from Order.models import Order

SECRET_KEY = 'kingly1370'

def sendconfig(Dict):
    temp = {'title': config.title, 'description': config.description}
    Dict.update(temp)
    return Dict


def send_verification_email(account):
    token = generate_token(account)
    verification_link = f"{settings.BASE_URL}/account/verify/?token={token}"
    message = format_html(
        f'親愛的 {account.ac_name}：<br><br>'
        '感謝您註冊王道NLU平台之試用帳號，<br>'
        '此信件憑證有效時間為1小時，若驗證憑證失效請重新申請驗證。<br>'
        '請點選以下連結完成信箱驗證：<br><br><a href="{}">{}</a>',
        verification_link,
        verification_link
    )
    send_mail(
        '王道NLU平台信箱驗證',
        '',
        settings.EMAIL_HOST_USER,
        [account.email],
        html_message=message,
        fail_silently=False,
    )


def send_passowrd_email(account):
    token = generate_token(account)
    password_link = f"{settings.BASE_URL}/account/NewPassword/?token={token}"
    message = format_html(
        f'親愛的 {account.ac_name}：<br><br>'
        '您已在王道NLU平台使用忘記密碼功能，<br>'
        '若您並沒有使用此功能，請忽略此信，也請不要點選下面連結!!<br>'
        '此信件憑證有效時間為1小時，若驗證憑證失效請重新申請。<br>'
        '請點選下面連結來變更您的密碼：<br><br><a href="{}">{}</a>',
        password_link,
        password_link
    )
    send_mail(
        '王道NLU平台忘記密碼通知',
        '',
        settings.EMAIL_HOST_USER,
        [account.email],
        html_message=message,
        fail_silently=False,
    )

def generate_token(account):
    current_time = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    token_data = current_time.encode('utf-8')
    signature = hmac.new(SECRET_KEY.encode('utf-8'), token_data, hashlib.sha256).digest()
    token = base64.urlsafe_b64encode(token_data + signature).decode('utf-8')
    account.verify_token = token
    account.save(update_fields=['verify_token'])
    return token


def is_token_valid(token, expiration_time):
    decoded_token = base64.urlsafe_b64decode(token.encode('utf-8'))
    token_data = decoded_token[:-32]
    signature = decoded_token[-32:]
    expected_signature = hmac.new(SECRET_KEY.encode('utf-8'), token_data, hashlib.sha256).digest()
    if signature == expected_signature:
        created_time = datetime.datetime.strptime(token_data.decode('utf-8'), "%Y%m%d%H%M%S")
        print(created_time)
        elapsed_time = datetime.datetime.now() - created_time
        print(elapsed_time)
        return elapsed_time <= expiration_time
    return False

class Verify(View):
    """
    驗證信箱
    """

    @staticmethod
    def get(request):
        token = request.GET.get('token')
        expiration_time = timedelta(hours=1)  # 设置有效期为1小时
        account = Account.objects.filter(verify_token=token).first()  # 將account設置為實例變數
        if account.state == 1:
            ret = {'code': 'already_verify'}
            return render(request, 'report.html', sendconfig(ret))
        elif is_token_valid(token, expiration_time):
            account.state = 1
            account.save(update_fields=['state'])
            random = get_random_string(length=20)
            current_timezone = timezone.now()
            current_date = current_timezone.strftime('%Y%m%d')
            random_cplan_code = current_date + random
            plan = Plan.objects.get(plan_id=1)

            year = datetime.date.today().year
            month = datetime.date.today().month
            day = datetime.date.today().day
            random = get_random_string(length=8)
            order_no = str(year) + str(month) + str(day) + random

            free_order = Order.objects.create(
                order_no=order_no,
                ac_id=account.ac_name,
                status="4",
                plan_id=plan.plan_id,
                price=plan.plan_price,
                order_time=datetime.datetime.now(),
                sucess_time=datetime.datetime.now()
            )

            ClientPlan.objects.create(
                id=random_cplan_code,
                ac=account,
                order_id=free_order.order_no,
                plan_name=plan.plan_name,
                max_app=plan.max_app,
                max_manager=plan.max_manager,
                max_secondary=plan.max_secondary,
                max_call=plan.max_call,
                plan_end=datetime.datetime.now() + timedelta(days=plan.expiry_date),
            )
            ret = {'code': 'verify_OK'}
            return render(request, 'report.html', sendconfig(ret))
        else:
            ret = {'code': 'verify_NG'}
            form = VerifyForm(account.email)
            temp = dict(form=form)
            ret.update(temp)
            return render(request, 'report.html', sendconfig(ret))

    @staticmethod
    def post(request):
        token = request.GET.get('token')
        account = Account.objects.filter(verify_token=token).first()  # 將account設置為實例變數
        mail = request.POST['email']
        pattern = r'^[\w\.-]+@[\w\.-]+\.\w+$'
        if not re.match(pattern, mail):
            ret = {'code' : 'verify_NG', 'msg' : "信箱格式不正確！"}
            form = VerifyForm(account.email)
            temp = dict(form=form)
            ret.update(temp)
            return render(request, 'report.html', sendconfig(ret))
        else:
            if mail == account.email:
                pass
            else:
                account.email = mail
                account.save(update_fields=['email'])
            send_verification_email(account)
            ret = {'code': 'verify_Pass'}
            return render(request, 'report.html', sendconfig(ret))


class NewPassword(View):
    """
    變更新密碼
    """

    @staticmethod
    def get(request):
        token = request.GET.get('token')
        expiration_time = timedelta(hours=1)
        if is_token_valid(token, expiration_time):
            form = NewPasswordForm()
            context = dict(form=form)
            temp = {'code': 'New_password'}
            context.update(temp)
            return render(request, 'input_form.html', sendconfig(context))

    @staticmethod
    def post(request):
        token = request.GET.get('token')
        account = Account.objects.filter(verify_token=token).first()
        print(account)
        ret = dict(form=NewPasswordForm())
        new_password = request.POST['new_password']
        confirm_password = request.POST['new_passwordConfirm']
        if new_password != confirm_password:
            ret['msg'] = "確認密碼輸入錯誤！"
            temp = {'code': 'New_password'}
            ret.update(temp)
            return render(request, 'input_form.html', sendconfig(ret))
        else:
            data = str.encode(new_password)
            hash_object = hashlib.sha256()
            hash_object.update(data)
            new_password = hash_object.hexdigest()
            account.ac_pwd = new_password
            account.save(update_fields=['ac_pwd'])
            temp = {'code': 'Password_OK'}
            ret.update(temp)
            return render(request, 'report.html', sendconfig(ret))
