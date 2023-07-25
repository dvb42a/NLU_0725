# ChitBot/urls.py
from django.urls import path
import Order.views
from Middleware.Member import LoginMiddleware

app_name = "Order"
urlpatterns = [
    # tool -- 匯入語句模板
    path('', Order.views.create_order.as_view(), name="order_create"),
    path('receipt/<str:id>', LoginMiddleware(Order.views.receipt.as_view()), name="order_submit"),
]
