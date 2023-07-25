from django.urls import path
import Accounts.views
import Verify.views

app_name = "Accounts"
urlpatterns = [
    # 登入
    path('login/', Accounts.views.LoginView.as_view(), name="login"),
    # 登出
    path('logout/', Accounts.views.LogoutView.as_view(), name="logout"),
    # 註冊
    path('signup/', Accounts.views.SignupView.as_view(), name="signup"),
    # 忘記密碼
    path('password/', Accounts.views.PasswordView.as_view(), name="password"),
    # 強制登入
    path('enforce/', Accounts.views.Enforce.as_view(), name="enforce"),

    # event-stream
    path('eventsource/', Accounts.views.event_source, name="eventsource"),
    # 信箱驗證
    path('verify/', Verify.views.Verify.as_view(), name="verify"),
    # 變更密碼
    path('NewPassword/', Verify.views.NewPassword.as_view(), name="newpassword"),

    path('edit/', Accounts.views.edit.as_view(),name="edit"),
    # path('payment/', Accounts.views.payment.as_view(),name="payment"),
    path('safety/',Accounts.views.safety.as_view(),name="safety")
]
