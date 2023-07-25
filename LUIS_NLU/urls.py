"""LUIS_NLU URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf.urls import url
from django.conf import settings
from django.views import static
import Accounts.urls
import app.urls
import Admin.urls
import Order.urls
import Client.urls
from . import views

urlpatterns = [
    path('', views.Homepage, name="home"),
    # Accounts
    path('account/', include(Accounts.urls)),  # 平台登入/登出/註冊
    # Admin 管理平台
    path('admin/', include(Admin.urls)),
    # app
    path('app/', include(app.urls)),
    # Order
    path('order/', include(Order.urls)),
    # 問答 API
    path('api/qa/', app.views.qa_endpoint_api),  # 設備用 QA API
    # 客戶APP與方案
    path('client/', include(Client.urls)),

    url(r'^static/(?P<path>.*)$', static.serve, {'document_root': settings.STATIC_ROOT}, name='static')  # 靜態文件url
]


#  配置異常頁
handler500 = app.views.page_not_found
