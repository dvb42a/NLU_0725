from django.db import models
from django.utils import timezone
from Accounts.models import Account as AuthUser
from Order.models import Order

class ClientPlan(models.Model):
    """
    公司擁有之專案
    """
    id = models.CharField(primary_key=True,blank=True,max_length=20)
    ac = models.ForeignKey(AuthUser, on_delete=models.DO_NOTHING, related_name='ac')
    order = models.ForeignKey(Order, on_delete=models.DO_NOTHING, related_name='order')
    plan_name = models.CharField(max_length=50)
    max_app = models.IntegerField()
    max_manager = models.IntegerField()
    max_secondary = models.IntegerField()
    max_call = models.IntegerField()

    plan_start = models.DateTimeField(default=timezone.now)
    plan_end = models.DateTimeField(blank=True)

    class Meta:
        db_table = 'kingly_clients_plan'
    def __str__(self):
        return self.plan_name