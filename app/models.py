from django.db import models
from django.utils import timezone
from Accounts.models import Account


# Create your models here.
class App(models.Model):
    name = models.CharField(max_length=200)
    created_date = models.DateTimeField(default=timezone.now)
    app_id = models.CharField(max_length=250)
    version_id = models.CharField(max_length=20)

    class Meta:
        db_table = 'app'

    def __str__(self):
        return self.name

