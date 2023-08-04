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


    class Meta:
        db_table="kingly_order"

    def __str__(self):
        return self.order_no