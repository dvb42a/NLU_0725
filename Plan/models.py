from django.db import models
from django.utils import timezone

class Plan(models.Model):
    """
    購買之方案
    """
    plan_id = models.IntegerField(primary_key=True,blank=True)
    plan_name = models.CharField(max_length=50)
    plan_price = models.IntegerField()
    max_app = models.IntegerField()
    max_manager = models.IntegerField()
    max_secondary = models.IntegerField()
    max_call = models.IntegerField()
    expiry_date = models.IntegerField()
    created_date = models.DateTimeField(default=timezone.now,blank=True)
    updated_date = models.DateTimeField(blank=True)

    class Meta:
        db_table = 'kingly_plan'

    def __str__(self):
        return self.plan_name