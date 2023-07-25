from django.http import HttpResponseRedirect
from django.utils import timezone
from Accounts.models import Account
from Accounts.shortcut_url import *
from BColor import SystemStatus


def login_required(func):
    """需要登入"""
    login_url = LOGIN_URL
    def is_authenticated(request, *args, **kwargs):
        request.session.clear_expired()
        if request.session.get('is_login', None):
            context = dict(current_time=timezone.now())
            user_token = request.session.get('token')
            try:
                account = Account.objects.get(ac_token=user_token)
                context["account"] = account
            except Account.DoesNotExist:
                # 登入驗證出錯，清空 session 強制登出
                request.session.flush()
                return HttpResponseRedirect(login_url)

            # perm_type = permission_authenticate(user_token)
            # if perm_type is not None:
            #     context["permission"] = perm_type.value
            #     context["permission_name"] = get_permission_name(perm_type.value)
            # else:
            #     context["permission"] = None
            return func(request, context)
        request.session.flush()
        return HttpResponseRedirect(login_url)
    return is_authenticated


def authenticate(name, pwd):
    """帳號驗證"""
    try:
        user = Account.objects.get(ac_name=name)
        if user.state == 0 :
            return 1
        elif user.ac_pwd == pwd:
            return user
        else:
            print(SystemStatus.WARNING, "登入密碼錯誤！")
            return 2
    except Account.DoesNotExist:
        print(SystemStatus.WARNING, "查無此帳號！")
        return 3


# def admin_permission_required(func):
#     """需要管理權限"""
#     home_url = INDEX_URL
#
#     def is_authenticated(request, *args, **kwargs):
#         if request.session.get('is_login', None):
#             user_token = request.session.get('token')
#             try:
#                 user = BaseLogin.objects.get(ac_token=user_token)
#                 role = AuthRole.objects.get(role_id=user.role)
#                 if role.role_perm.perm_id == "admin_perm":
#                     return func(request)
#                 else:
#                     print(SystemStatus.WARNING, "此帳號權限不足！")
#             except BaseLogin.DoesNotExist:
#                 print(SystemStatus.ERROR, "查無此帳號！")
#                 pass
#             except AuthRole.DoesNotExist:
#                 print(SystemStatus.ERROR, "角色不存在")
#                 pass
#         return HttpResponseRedirect(home_url)
#     return is_authenticated

# def permission_authenticate(user_token):
#     """權限驗證"""
#     try:
#         user = BaseLogin.objects.get(ac_token=user_token)
#         role = BaseLogin.objects.get(role_id=user.role)
#         user_perm_id = role.role_perm.perm_id
#         if user_perm_id == PermissionType.system_admin.value:
#             print(SystemStatus.INFO, "[{}]此帳號權限為[系統管理者]".format(user.ac_name))
#             return PermissionType.system_admin
#         elif user_perm_id == PermissionType.app_manager.value:
#             print(SystemStatus.INFO, "[{}]此帳號權限為[App 管理者]".format(user.ac_name))
#             return PermissionType.app_manager
#         else:
#             print(SystemStatus.INFO, "[{}]此帳號權限為[一般帳號]".format(user.ac_name))
#             return PermissionType.general_user
#     except BaseLogin.DoesNotExist:
#         print(SystemStatus.WARNING, "查無此帳號！")
#         return None
#     except AuthRole.DoesNotExist:
#         print(SystemStatus.ERROR, "角色不存在")
#         return None


# def app_authenticate(app_id, user_id):
#     """app 使用權限"""
#     try:
#         topic_obj = TopicApp.objects.get(id=app_id)
#         if topic_obj.owner_id.ac_id == user_id:
#             print(SystemStatus.INFO, user_id, "是App擁有者")
#             return True
#     except TopicApp.DoesNotExist:
#         pass
#
#     try:
#         TopicAppUser.objects.get(
#             app_id=app_id,
#             user_id=user_id
#         )
#         print(SystemStatus.INFO, user_id, "可讀取App_id: ", app_id)
#         return True
#     except TopicAppUser.DoesNotExist:
#         print(SystemStatus.WARNING, user_id, "不可讀取App_id: ", app_id)
#         return False
#
#
# def check_role_perm_exist():
#     """確認已初始化基本權限資料與角色"""
#
#     if AuthPermission.objects.all().count() == 0:
#         """權限"""
#         admin_perm = AuthPermission.objects.create(
#             perm_id="admin_perm",
#             perm_name="Admin permission",
#             perm_desc="System manager"
#         )
#         app_manager_perm = AuthPermission.objects.create(
#             perm_id="app-manager_perm",
#             perm_name="App manager permission",
#             perm_desc="Can manage App"
#         )
#         general_perm = AuthPermission.objects.create(
#             perm_id="general_perm",
#             perm_name="General permission",
#             perm_desc="Can upload/delete data, test QA, log"
#         )
#         print("[權限] 已初始化")
#
#         """角色"""
#         set_role_list = [
#             ("admin_role", "Admin user", admin_perm),
#             ("app-manager_role", "App manager", app_manager_perm),
#             ("general_role", "General user", general_perm)
#         ]
#         for id, name, perm in set_role_list:
#             AuthRole.objects.create(
#                 role_id=id,
#                 role_name=name,
#                 role_perm=perm
#             )
#         print("[角色] 已初始化")
#     else:
#         pass


def get_user_info(request):
    """取得帳號資訊"""
    user_token = request.session.get('token')
    try:
        account = Account.objects.get(ac_token=user_token)
        return account
    except Account.DoesNotExist:
        return None

# def get_main_info(request):
#     """取得帳號資訊"""
    # user_ = request.session.get('l')
    # try:
    #     account = BaseLogin.objects.get(ac_name=user)
    #     return account
    # except BaseLogin.DoesNotExist:
    #     return None

