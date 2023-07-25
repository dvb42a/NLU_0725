from django import forms
from django.forms import ModelForm
from Plan.models import Plan
class CreateForm(ModelForm):

    class Meta:
        model= Plan
        fields = ('plan_name', 'plan_pay', 'plan_app', 'plan_person', 'plan_employee', 'plan_file', 'plan_count',
                  'expired_at')
        labels={
            'plan_name': '方案名稱',
        }
    plan_name = forms.CharField(label="方案名稱",
                                required=True, max_length=50,
                                error_messages={
                                    "required": "方案名稱不能為空",
                                    "max_length": "方案名稱不能大於50字元",
                                    'unique': "方案名稱已存在"
                                },
                                widget=forms.TextInput(
                                    attrs={"class": "form-control",
                                           "placeholder": "請輸入方案名稱",
                                           "autocomplete" : "off"}
                                ))
    plan_pay = forms.IntegerField(label="費用",
                                widget=forms.NumberInput(
                                    attrs={"class": "form-control",
                                           "placeholder": "輸入數量...",
                                           "autocomplete" : "off"}
                                ))
    plan_app = forms.IntegerField(label="方案可使用APP數量",
                                widget=forms.NumberInput(
                                    attrs={"class": "form-control",
                                           "placeholder": "輸入數量...",
                                           "autocomplete" : "off"}
                                ))
    plan_person = forms.IntegerField(label="方案APP可操作人數上限",
                                widget=forms.NumberInput(
                                    attrs={"class": "form-control",
                                           "placeholder": "輸入數量...",
                                           "autocomplete" : "off"}
                                ))
    plan_employee = forms.IntegerField(label="方案提供額外公司可新增帳號數量",
                                widget=forms.NumberInput(
                                    attrs={"class": "form-control",
                                           "placeholder": "輸入數量...",
                                           "autocomplete" : "off"}
                                ))
    plan_file = forms.IntegerField(label="方案APP可上載文件之數量",
                                widget=forms.NumberInput(
                                    attrs={"class": "form-control",
                                           "placeholder": "輸入數量...",
                                           "autocomplete" : "off"}
                                ))
    plan_count = forms.IntegerField(label="APP可查詢次數上限",
                                widget=forms.NumberInput(
                                    attrs={"class": "form-control",
                                           "placeholder": "輸入數量...",
                                           "autocomplete" : "off"}
                                ))
    expired_at = forms.IntegerField(label="期限",
                                 widget=forms.NumberInput(
                                     attrs={"class": "form-control",
                                            "placeholder": "輸入天數...",
                                            "autocomplete": "off"}
                                 ))
