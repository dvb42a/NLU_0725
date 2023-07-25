from django.urls import path
import Client.views

app_name = "Client"
urlpatterns = [
   path('app/', Client.views.app.as_view(), name="app"),
   path('app/detail/<path:id>', Client.views.app_index.as_view(), name="appIndex"),
   path('member/', Client.views.member.as_view(), name="member"),
   path('order/',Client.views.order.as_view(), name="order"),
   path('order/detail/<path:id>', Client.views.order_index.as_view(), name="orderIndex")
]
