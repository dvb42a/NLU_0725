from django.db import models
from Accounts.models import Account
from Plan.models import Plan
class Order(models.Model):
    """
    訂單
    """
    order_no = models.CharField(primary_key=True,max_length=12)
    ac = models.ForeignKey(Account, on_delete=models.DO_NOTHING, related_name='order')
    plan = models.ForeignKey(Plan, on_delete=models.DO_NOTHING ,related_name='order')
    status = models.IntegerField()
    price = models.IntegerField()
    order_time = models.DateTimeField()
    client_submit_time = models.DateTimeField()
    pay_time = models.DateTimeField(blank=True)
    sucess_time = models.DateTimeField(blank=True)
    name = models.CharField(max_length=10)
    bankaccount=models.IntegerField()
    phone_number=models.CharField(max_length=10)


    class Meta:
        db_table="kingly_order"

    def __str__(self):
        return self.order_no

    def order_state(self):
        if self == '0':
            return '已建立訂單'
        if self == '1':
            return '已填寫匯款資訊及匯款'
        if self == '2':
            return '已查收匯款'
        if self == '3':
            return '已開通服務'
        if self == '4':
            return '完成訂單'
        if self == '5':
            return '訂單已被取消'