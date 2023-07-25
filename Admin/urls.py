from django.urls import path
import Accounts.views
import Plan.views

app_name = "Admin"

urlpatterns = [

    # 帳號權限管理
    #path('account/', RoleMiddleware(Accounts.views.AccountManageView.as_view()), name="account"),
    # 方案管理
    #path('plan/', RoleMiddleware(Plan.views.IndexView.as_view()), name="plan"),
    #path('plan/edit/<int:id>', EditMiddleware(Plan.views.EditView.as_view()), name="planEdit"),

]