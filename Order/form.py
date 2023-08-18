from django import forms
from django.forms import ModelForm
from Order.models import Order
from django.core.validators import RegexValidator



class CreateForm(ModelForm):
    class Meta:
        model = Order
        fields = ('bankaccount', 'name', 'phone_number')

    bankaccount = forms.CharField(label="匯款帳戶後五碼",

                                     required=True,
                                     max_length=5,
                                     min_length=5,
                                     validators=[
                                         RegexValidator(
                                             regex=r'^\d*$',
                                             message="只可輸入數字"
                                         )
                                     ],
                                     error_messages={
                                         "required": "銀行帳戶不能為空",
                                         "max_length": "銀行帳戶不能大於5字元",
                                         "min_length": "銀行帳戶不能小於5字元",
                                     },
                                     widget=forms.TextInput(
                                         attrs={"class": "form-control",
                                                "placeholder": "XXXXX",
                                                "autocomplete": "off",
                                                "id":'InputBankAccount',
    }
                                     ))
    name = forms.CharField(label="匯款人中文姓名",
                                   required=True,
                                   max_length=5,
                                   validators=[
                                       RegexValidator(
                                           regex=r'^[\u4e00-\u9fa5]*$',
                                           message="只可輸入中文"
                                       )
                                   ],
                                  error_messages={
                                      "required": "匯款人中文姓名不能為空",
                                      "max_length": "匯款人中文姓名不能大於5字元",
                                  },
                                  widget=forms.TextInput(
                                      attrs={"class": "form-control",
                                             "placeholder": "請輸入匯款人中文姓名",
                                             "autocomplete": "off",
                                             "id":'InputName',}
                                  ))
    phone_number = forms.CharField(label="電話號碼",
                                  required=True,
                                  max_length=10,
                                  min_length=10,
                                  validators=[
                                       RegexValidator(
                                           regex=r'^\d*$',
                                           message="只可輸入數字"
                                       )
                                  ],
                                  error_messages={
                                      "required": "電話號碼不能為空",
                                      "max_length": "電話號碼不能多於10個字元",
                                      "min_length": "電話號碼不能少於10個字元"
                                  },
                                  widget=forms.TextInput(
                                      attrs={"class": "form-control",
                                             "placeholder": "09XX XXX XXX",
                                             "autocomplete": "off",
                                             "id":'InputPhoneNumber',}
                                  ))
