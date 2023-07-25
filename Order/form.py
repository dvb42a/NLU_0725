from django import forms
from django.forms import ModelForm
from Order.models import Order


class CreateForm(ModelForm):
    class Meta:
        model = Order
        fields = ('bankaccount', 'name', 'phone_number')

    bankaccount = forms.IntegerField(label="匯款帳戶後四碼",
                                     required=True,
                                     error_messages={
                                         "required": "銀行帳戶不能為空",
                                         "max_length": "銀行帳戶不能大於4字元",
                                         'invalid': "只可輸入數字"
                                     },
                                     widget=forms.TextInput(
                                         attrs={"class": "form-control",
                                                "placeholder": "請輸入匯款帳戶後四碼",
                                                "autocomplete": "off"}
                                     ))
    name = forms.CharField(label="匯款人中文姓名",
                              required=True,
                              error_messages={
                                  "required": "匯款人中文姓名不能為空",
                                  "max_length": "匯款人中文姓名不能大於5字元",
                              },
                              widget=forms.TextInput(
                                  attrs={"class": "form-control",
                                         "placeholder": "請輸入匯款人中文姓名",
                                         "autocomplete": "off"}
                              ))
    phone_number = forms.CharField(label="電話號碼",
                                      required=True,
                                      error_messages={
                                          "required": "電話號碼不能為空",
                                          "max_length": "電話號碼不能大於9字元",
                                          'invalid': "只可輸入數字"
                                      },
                                      widget=forms.TextInput(
                                          attrs={"class": "form-control",
                                                 "placeholder": "請輸入電話號碼",
                                                 "autocomplete": "off"}
                                      ))
