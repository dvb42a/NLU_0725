from django.db import models
from Client.models import ClientPlan
from django.utils import timezone
from Accounts.models import Account

# Create your models here.

class Apps(models.Model):
    """
    任務資訊
    """
    id = models.IntegerField(primary_key=True,blank=True)
    plan = models.ForeignKey(ClientPlan, on_delete=models.DO_NOTHING, related_name='plan_app')
    ac = models.ForeignKey(Account, on_delete=models.DO_NOTHING, related_name='apps')
    state = models.IntegerField(default=1, blank=True)
    app_name = models.CharField(max_length=32)
    app_desc = models.TextField()
    app_culture = models.CharField(default="中文", blank=True,max_length=20)
    counter = models.IntegerField(default=0,blank=True)
    created_date = models.DateTimeField(default=timezone.now)
    last_trained_date = models.DateTimeField()
    last_deployed_date = models.DateTimeField()
    deleted_date = models.DateTimeField()
    train_version = models.IntegerField(default=0, blank=True)
    deploy_version = models.IntegerField(default=0, blank=True)
    trained = models.IntegerField(default=0, blank=True)
    deployed = models.IntegerField(default=0, blank=True)
    training = models.IntegerField(default=0, blank=True)

    class Meta:
        db_table = 'kingly_app'

    def __str__(self):
        return self.app_name

    def state_starded(self):
        if self == '0':
            return '已刪除'
        if self == '1':
            return '正常'