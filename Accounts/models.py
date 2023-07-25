from django.db import models
from django.utils import timezone
from Accounts.TokenManager import token_generate
from BColor import SystemStatus
# Create your models here.


def update_last_login(user):
    """
    A signal receiver which updates the last_login date for
    the user logging in.
    """
    login_time = timezone.now()
    new_token = token_generate()
    user.ac_last_login = login_time
    user.ac_token = new_token
    user.save(update_fields=['ac_token', 'ac_last_login'])
    print(SystemStatus.INFO, "[{time}] ({user_name}) {user_id} 登入".format(
        time=login_time.isoformat(),
        user_name=user.ac_name,
        user_id=user.ac_id
    ))


# class AuthPermission(models.Model):
#     """
#     權限
#     """
#     perm_id = models.CharField(max_length=255, primary_key=True)
#     perm_name = models.CharField(max_length=255)
#     perm_desc = models.TextField()
#
#     class Meta:
#         db_table = 'kingly_Auth_Permission'
#
#     def __str__(self):
#         return self.perm_name


# class AuthRole(models.Model):
#     """
#     角色：用於權限綁定
#     """
#     role_id = models.CharField(max_length=255, primary_key=True)
#     role_name = models.CharField(max_length=255)
#     role_perm = models.ForeignKey(AuthPermission, on_delete=models.CASCADE)
#
#     class Meta:
#         db_table = 'kingly_Auth_Role'
#
#     def __str__(self):
#         return self.role_name


class Account(models.Model):
    """
    帳號資訊
    """

    ac_name = models.CharField(primary_key=True,max_length=50)
    ac_pwd = models.CharField(max_length=64)
    ac_token = models.CharField(max_length=28)
    state = models.IntegerField(default=0, blank=True)
    role = models.CharField(default="test_ac", blank=True,max_length=20)
    email = models.TextField()
    ac_join_date = models.DateTimeField(default=timezone.now)
    ac_last_login = models.DateTimeField(null=True)
    ac_rm_date = models.DateField()
    verify_token = models.CharField(max_length=64)

    class Meta:
        db_table = 'kingly_account'

    def __str__(self):
        return self.ac_name


class MainAccount(models.Model):
    """
    帳號資訊
    """
    ac = models.OneToOneField(Account, on_delete=models.CASCADE, related_name='main', primary_key=True)
    phone_number = models.CharField(max_length=10, null=True)
    real_name = models.CharField(max_length=50, null=True)
    bank_account = models.CharField(max_length=5, null=True)
    transfer_name = models.CharField(max_length=50, null=True)
    company_name = models.CharField(max_length=50, null=True)
    company_address = models.TextField()
    tax_number = models.CharField(max_length=8, null=True)

    class Meta:
        db_table = 'kingly_main_ac'

    def __str__(self):
        return self.company_name

class SecondaryAccount(models.Model):
    """
    帳號資訊
    """
    ac = models.OneToOneField(Account, on_delete=models.CASCADE, related_name='secondary', primary_key=True)
    description = models.TextField()
    main = models.CharField(max_length=50)

    class Meta:
        db_table = 'kingly_sec_ac'

    def __str__(self):
        return self.description


# class PermissionType(Enum):
#     """定義權限類別"""
#     system_admin = 'admin_perm'
#     app_manager = 'app-manager_perm'
#     general_user = 'general_perm'
#
#
# def get_permission_name(perm_type):
#     if perm_type == 'admin_perm':
#         return '系統管理員'
#     if perm_type == 'app-manager_perm':
#         return '專案管理員'
#     if perm_type == 'general_perm':
#         return '一般用戶'
#     return ''
#
# def get_role_name (role_name):
#     if role_name == 'admin_role':
#         return '系統管理員'
#     if role_name == 'app-manager_role':
#         return '專案管理員'
#     if role_name =='general_role':
#         return '一般用戶'
#     return ''


