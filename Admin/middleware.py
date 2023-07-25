from django.http import HttpResponse
from django.utils.deprecation import MiddlewareMixin
from Accounts.models import (
    AuthAccount, AuthRole,
    update_last_login, PermissionType, get_permission_name
)
from django.shortcuts import render
from Accounts.required import get_user_info

