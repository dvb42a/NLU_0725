from datetime import timedelta
from django.shortcuts import render
from django.http import HttpResponseRedirect, StreamingHttpResponse, JsonResponse
from Accounts.forms import LoginForm, SignupForm, PasswordForm, EditBase, EditPassword, EditMain
from Accounts.models import Account, update_last_login, MainAccount
from Accounts.required import login_required, authenticate, get_user_info
from Accounts.TokenManager import token_generate
from Accounts.shortcut_url import *
from Verify.views import send_verification_email,View,send_passowrd_email
from Client.models import ClientPlan
from Plan.models import Plan
from BColor import SystemStatus
from django.utils import timezone
import time,re,hashlib
import logging,string,secrets
from Order.models import Order
import config


logging.basicConfig(filename='log.txt',filemode='w')
userid = []
ret = {}

# 建立標題，歡迎詞 Ray
def sendconfig(Dict):
    temp = {'title': config.title, 'description': config.description}
    Dict.update(temp)
    return Dict


class IndexView(View):
    """
    主頁: 測試用首頁
    """
    @staticmethod
    @login_required
    def get(request, context):
        return render(request, 'bs4-dashboard.html', context)


def event_source(request):
    def stream_generator():
        while True:
            # 發送數據
            yield u'data: %s\n\n' % str(time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()))
            time.sleep(1)

    response = StreamingHttpResponse(stream_generator(), content_type="text/event-stream")
    response['Cache-Control'] = 'no-cache'
    return response


class LoginView(View):
    """
    登入
    """
    @staticmethod
    def get(request,nextrequest=None,plan=None):
        if 'next' in request.GET:
            nextrequest = request.GET['next']
            plan =request.GET['plan']
        if request.session.get('is_login', None):
            if nextrequest == "order":
                return HttpResponseRedirect("/" + nextrequest + "?plan=" + plan)
            else:
                return HttpResponseRedirect(INDEX_URL)
        form = LoginForm()
        context = dict(form=form)
        return render(request, 'login.html', sendconfig(context))

    @staticmethod
    def post(request,nextrequest=None,plan=None):
        if 'next' in request.GET:
            nextrequest = request.GET['next']
            plan =request.GET['plan']
        global ret
        login_form = LoginForm(request.POST)
        ret = dict(form=login_form)
        if login_form.is_valid():
            login_name = request.POST['user_name']
            login_pwd_code = request.POST['password']
            data = str.encode(login_pwd_code)
            # 建立SHA256物件
            hash_object = hashlib.sha256()
            # 對資料進行加密
            hash_object.update(data)
            # 取得加密後的結果
            login_pwd = hash_object.hexdigest()
            user = authenticate(name=login_name, pwd=login_pwd)
            if not isinstance(user, int):
                # 登入成功
                try:
                    if login_name in userid:
                        ret['confirm'] = "OK"
                        return render(request, 'login.html', sendconfig(ret))
                    userid.append(login_name)
                    user.ac_last_login = timezone.now()
                    user.save(update_fields=['ac_last_login'])
                    request.session['login_name'] = login_name
                    request.session['is_login'] = True
                    request.session['token'] = user.ac_token
                    try:
                        request.session['login_time'] = time.mktime(user.ac_last_login.utctimetuple())
                    except AttributeError:
                        pass
                    # 瀏覽器關閉，session 立即失效
                    request.session.set_expiry(0)
                    if nextrequest == "order":
                        return HttpResponseRedirect("/" + nextrequest + "?plan="+plan)
                    else:
                        return HttpResponseRedirect(INDEX_URL)
                except Exception as e:
                    logging.exception(e)
            elif user == 3:
                ret['msg'] = "查無此帳號！"
            elif user == 1:
                ret['msg'] = "信箱驗證尚未通過！請檢查您的Email！"
            else:
                ret['msg'] = "帳號或密碼錯誤！"
        else:
                ret['msg'] = "帳號和密碼不可為空"
        return render(request, 'login.html',  sendconfig(ret))


class LogoutView(View):
    """
    登出
    """
    @staticmethod
    def get(request):
        if not request.session.get('is_login', None):
            return HttpResponseRedirect(INDEX_URL)
        try:
            userid.remove(request.session['login_name'])
        except:
            pass
        request.session.flush()
        return HttpResponseRedirect(LOGIN_URL)


class SignupView(View):
    """
    註冊
    """
    @staticmethod
    def get(request):
        form = SignupForm()
        context = dict(form=form)
        temp = {'code': 'Signup'}
        context.update(temp)
        return render(request, 'input_form.html', sendconfig(context))

    @staticmethod
    def post(request):
        signup_form = SignupForm(request.POST)
        ret = dict(form=signup_form)
        if signup_form.is_valid():
            signup_name = request.POST['user_name']
            try:
                user = Account.objects.get(ac_name=signup_name)
                print(SystemStatus.WARNING, f"此 {user.ac_name} 帳號已存在!")
                ret['msg'] = "此帳號已存在！"
            except Account.DoesNotExist:
                # 建立帳號中...
                signup_pwd1 = request.POST['password1']
                signup_pwd2 = request.POST['password2']
                signup_mail = request.POST['email']
                pattern = r'^[\w\.-]+@[\w\.-]+\.\w+$'
                if signup_pwd1 != signup_pwd2:
                    # 密碼驗證失敗
                    print(SystemStatus.WARNING, "確認密碼輸入錯誤！")
                    ret['msg'] = "確認密碼輸入錯誤！"
                elif not re.match(pattern, signup_mail):
                    # 信箱格式驗證失敗
                    print(SystemStatus.WARNING, "信箱格式不正確！")
                    ret['msg'] = "信箱格式不正確！"
                else:
                    # 密碼驗證成功
                    data = str.encode(signup_pwd1)
                    # 建立SHA256物件
                    hash_object = hashlib.sha256()
                    # 對資料進行加密
                    hash_object.update(data)
                    # 取得加密後的結果
                    signup_pwd1 = hash_object.hexdigest()
                    # # 「試用帳戶」
                    # user_uuid = my_uuid(salt='general')
                    # account_id = user_uuid
                    # 建立帳號並設定預設角色為「試用帳戶」
                    new_account = Account.objects.create(
                        # ac_id=account_id,
                        ac_name=signup_name,
                        ac_pwd=signup_pwd1,
                        ac_token=token_generate(),
                        email=signup_mail,
                        ac_rm_date='9999-12-31',
                    )
                    send_verification_email(new_account)
                    print(SystemStatus.INFO, f"此 {signup_name} 帳號已建立成功!")
                    # print(SystemStatus.INFO, f"{new_account.plan.all()[0].plan_name}")
                    ret = dict(account=new_account.ac_name)
                    temp = {'code': 'register_success'}
                    ret.update(temp)
                    return render(request, 'report.html', sendconfig(ret))
            temp = {'code': 'Signup'}
            ret.update(temp)
        else:
            ret['msg'] = "資料填寫不完整！"
        return render(request, 'input_form.html', sendconfig(ret))


# class AccountManageView(View):
#     @staticmethod
#     @login_required
#     def get(request, context):
#         """
#         帳號權限管理頁
#         """
#         try:
#             account_list = list(BaseLogin.objects.all())
#             for i, account in enumerate(account_list):
#                 role = AuthRole.objects.get(role_id=account.role)
#                 role_perm_id = role.role_perm_id
#                 role_perm_name = get_permission_name(role_perm_id)
#                 account_list[i].role_perm_name = role_perm_name
#             context["account_list"] = account_list
#
#             role_list = AuthRole.objects.all()
#             for i, role in enumerate(role_list):
#                 role_perm_id = role.role_perm_id
#                 role_perm_name = get_permission_name(role_perm_id)
#                 role_list[i].role_perm_name = role_perm_name
#             context["role_list"] = role_list
#         except BaseLogin.DoesNotExist:
#             print("BaseLogin 讀取錯誤")
#             pass
#         return render(request, 'Admin/account_manage.html', context)
#
#     @staticmethod
#     def post(request):
#         """
#         編輯帳號權限
#         """
#         if request.is_ajax():
#             """帳戶權限更新(限「系統管理者」操作)"""
#             acid = request.POST.get('acid', None)
#             role = request.POST.get('role', None)
#             try:
#                 account = BaseLogin.objects.get(ac_id=acid)
#                 account.role = role
#                 account.save()
#                 return JsonResponse({'msg': "更新權限成功", 'code': 1})
#             except BaseLogin.DoesNotExist:
#                 return JsonResponse({'msg': "更新權限失敗", 'code': -1})

class Enforce(View):
    """
    強制登入
    """
    @staticmethod
    def get(request):
        login_name = ret['login_name']
        login_pwd = ret['login_pwd']
        user = authenticate(name=login_name, pwd=login_pwd)
        update_last_login(user=user)
        request.session['login_name'] = login_name
        request.session['is_login'] = True
        request.session['login_time'] = time.mktime(user.ac_last_login.utctimetuple())
        # 瀏覽器關閉，session 立即失效
        request.session.set_expiry(0)
        return HttpResponseRedirect(INDEX_URL)


class PasswordView(View):
    """
    忘記密碼
    """
    @staticmethod
    def get(request):
        form = PasswordForm()
        ret = dict(form=form)
        temp = {'code': 'forget_password'}
        ret.update(temp)
        return render(request, 'input_form.html', sendconfig(ret))

    @staticmethod
    def post(request):
        password_form = PasswordForm(request.POST)
        ret = dict(form=password_form)
        if password_form.is_valid():
            # 之後要做判斷是否為副帳號的功能
            user_name = request.POST['user_name']
            post_email = request.POST['email']
            pattern = r'^[\w\.-]+@[\w\.-]+\.\w+$'
            try:
                user = Account.objects.get(ac_name=user_name)
                if not re.match(pattern, post_email):
                    # 信箱格式驗證失敗
                    ret['msg'] = "信箱格式不正確！"
                elif user.role in "secondary_ac":
                    temp = {'code': 'account_secondary'}
                    ret.update(temp)
                    return render(request, 'report.html', sendconfig(ret))
                elif user.email.lower() == post_email.lower():
                    send_passowrd_email(user)
                    temp = {'code': 'confirm_OK'}
                    ret.update(temp)
                    return render(request, 'report.html', sendconfig(ret))
                else:
                    ret['msg'] = "帳號、Email資訊核對不正確!!"
            except:
                ret['msg'] = f"找不到以 {user_name} 所建立的帳號!"
        else:
            ret['msg'] = "資料填寫不完整！"
        temp = {'code': 'forget_password'}
        ret.update(temp)
        return render(request, 'input_form.html', sendconfig(ret))


class edit(View):

    @staticmethod
    @login_required

    def get(request,context):
        account = get_user_info(request)
        try :
            main_account = MainAccount.objects.get(ac_id=account.ac_name)
            context['main_form'] = EditMain(instance=main_account)
        except MainAccount.DoesNotExist:
            main_account = None
            context['main_form'] = EditMain()
        context['base_form'] = EditBase(instance=account)
        context['password_form'] = EditPassword(instance=account)
        context['account'] = account
        context["dashborad"] = True
        return render(request, 'Account/editAccount.html', sendconfig(context))

    @staticmethod
    @login_required
    def post(request,context):

        account = get_user_info(request)
        base_form = EditBase(request.POST or None, instance=account)
        try:
            main_account = MainAccount.objects.get(ac_id=account.ac_name)
            main_form = EditMain(request.POST or None)
            print('is null')
            if main_form.is_valid():
                print('pass_valid')
                new_data = MainAccount(
                    ac_id=account.ac_name,
                    real_name=request.POST['real_name'],
                    bank_account=request.POST['bank_account'],
                    phone_number=request.POST['phone_number'],
                    transfer_name=request.POST['transfer_name'],
                )
                new_data.save()
        except MainAccount.DoesNotExist:
            main_form = EditMain(request.POST or None, instance=main_account)
            if main_form.is_valid():
                main_form.save()
            print('123')
            main_form = EditMain(request.POST or None)




        if base_form.is_valid():
            base_form.save()
            context['message']="更新完成!"
        context['base_form'] = base_form
        context['main_form'] = main_form
        context['password_form'] = EditPassword(instance=account)
        context['account'] = account
        context["dashborad"] = True
        return render(request, 'Account/editAccount.html', sendconfig(context))

# class payment(View):
#
#     @staticmethod
#     @login_required
#     def get(request,context):
#         account=BaseLogin.objects.get(ac_name=get_user_name(request))
#         order=Order.objects.filter(ac_id=account.ac_id).order_by('-order_time')
#         context['orders']=order
#         context['form']=EditPayment(instance=account)
#         context['account']=account
#         return render(request, 'Account/editOrder.html',context)
#
#     @staticmethod
#     @login_required
#     def post(request,context):
#         account=BaseLogin.objects.get(ac_name=get_user_name(request))
#         form = EditPayment(request.POST or None, instance=account)
#         order = Order.objects.filter(ac_id=account.ac_id).order_by('-order_time')
#         if form.is_valid():
#             form.save()
#             context['message'] = "更新完成!"
#         context['orders'] = order
#         context['form'] = EditPayment(instance=account)
#         context['account'] = account
#         return render(request, 'Account/editOrder.html',context)


class safety(View):
    # @staticmethod
    # @login_required
    # def get(request, context):
    #     account = get_user_info(request)
    #     context['form'] = EditPassword(instance=account)
    #     context['account'] = account
    #     return render(request, 'Account/editSafety.html',context)
    @staticmethod
    @login_required
    def post(request, context):
        print("password")
        # account = BaseLogin.objects.get(ac_name=get_user_name(request))
        # form = EditPassword(request.POST or None, instance=account)
        # if form.is_valid():
        #     password = request.POST.get('password', None)
        #
        #     new_password = request.POST.get('new_password',None)
        #     new_password2= request.POST.get('new_passwordConfirm', None)
        #
        #     #hashing the input password and validate it
        #     password_data=str.encode(password)
        #     hash_object=hashlib.sha256()
        #     hash_object.update(password_data)
        #     hashed_pwd=hash_object.hexdigest()
        #     if account.ac_pwd==hashed_pwd:
        #         #hashing the new password
        #         if new_password != new_password2:
        #             context['newPwdMsg'] = "確認密碼輸入錯誤"
        #             print('newpassword wrong')
        #         else:
        #             new_password_data=str.encode(new_password)
        #             hash_object_newPassword = hashlib.sha256()
        #             hash_object_newPassword.update(new_password_data)
        #             hashed_new_password=hash_object_newPassword.hexdigest()
        #             account.ac_pwd=hashed_new_password
        #             account.save()
        #             context['message']="已成功更新密碼!"
        #             print('new_password is active')
        #     else:
        #         context['oldPwdMsg'] = "現有密碼輸入錯誤!"
        # context['form'] = EditPassword(instance=account)
        # context['account'] = account
        context["dashborad"] = True
        return render(request, 'Account/editAccount.html', sendconfig(context))

