from django.db import models
from Accounts.models import MainAccount

class Order(models.Model):
    """
    訂單
    """
    order_no = models.CharField(primary_key=True,max_length=12)
    ac_main = models.ForeignKey(MainAccount, on_delete=models.DO_NOTHING, related_name='order')
    status = models.IntegerField()
    plan_name = models.CharField(max_length=20)
    price = models.IntegerField()
    order_time = models.DateTimeField()
    pay_time = models.DateTimeField(blank=True)
    sucess_time = models.DateTimeField(blank=True)


    class Meta:
        db_table="kingly_order"

    def __str__(self):
        return self.order_no