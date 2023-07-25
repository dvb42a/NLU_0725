from django import forms
from Accounts.models import Account, MainAccount



class LoginForm(forms.Form):
    user_name = forms.CharField(label="帳號",
                                required=True, min_length=2, max_length=20,
                                error_messages={
                                    "required": "帳號不能為空",
                                    "min_length": "帳號不少於2個字元",
                                    "max_length": "帳號不能大於20字元"
                                },
                                widget=forms.TextInput(
                                    attrs={"class": "form-control",
                                           "placeholder": "請輸入帳號",
                                           "autocomplete": "off"}
                                ))
    password = forms.CharField(label="密碼",
                               required=True, min_length=4, max_length=20,
                               error_messages={
                                   "required": "密碼不能為空",
                                   "min_length": "密碼不少於4個字元",
                                   "max_length": "密碼不能大於20字元"
                               },
                               widget=forms.PasswordInput(
                                   attrs={"class": "form-control",
                                          "placeholder": "請輸入密碼"}
                               ))


class SignupForm(forms.Form):
    # last_name = forms.CharField(label="姓氏",
    #                             required=True, max_length=10,
    #                             error_messages={
    #                                 "required": "姓氏不能為空",
    #                                 "max_length": "姓氏不能超過10個字元",
    #                             },
    #                             widget=forms.TextInput(
    #                                 attrs={"class": "form-control",
    #                                        "placeholder": "請輸入姓氏"}
    #                             ))
    # name = forms.CharField(label="名字",
    #                        required=True, max_length=50,
    #                        error_messages={
    #                            "required": "名稱不能為空",
    #                            "max_length": "名稱不能超過50個字元",
    #                        },
    #                        widget=forms.TextInput(
    #                            attrs={"class": "form-control",
    #                                   "placeholder": "請輸入名字"}
    #                        ))
    user_name = forms.CharField(label="帳號",
                                required=True, min_length=2, max_length=20,
                                error_messages={
                                    "required": "帳號不能為空",
                                    "min_length": "帳號不少於2個字元",
                                    "max_length": "帳號不能大於20字元"
                                },
                                widget=forms.TextInput(
                                    attrs={"class": "form-control",
                                           "placeholder": "請輸入帳號",
                                           "autocomplete": "off"}
                                ))
    password1 = forms.CharField(label="密碼",
                                required=True, min_length=4, max_length=20,
                                error_messages={
                                    "required": "密碼不能為空",
                                    "min_length": "密碼不少於4個字元",
                                    "max_length": "密碼不能大於20字元"
                                },
                                widget=forms.PasswordInput(
                                    attrs={"class": "form-control",
                                           "placeholder": "請輸入確認密碼"}
                                ))
    password2 = forms.CharField(label="確認密碼",
                                required=True, min_length=4, max_length=20,
                                error_messages={
                                    "required": "確認密碼不能為空",
                                    "min_length": "確認密碼不少於4個字元",
                                    "max_length": "確認密碼不能大於20字元"
                                },
                                widget=forms.PasswordInput(
                                    attrs={"class": "form-control",
                                           "placeholder": "請輸入確認密碼"}
                                ))
    email = forms.CharField(label="電郵地址",
                            required=True , max_length=100,
                            error_messages={
                                "required": "電郵地址不能為空",
                                "max_length": "電郵地址不能超過100字元"
                            },
                            widget=forms.TextInput(
                                attrs={"class": "form-control",
                                       "placeholder":"請輸入電郵地址"}
                            ))
    # company_name = forms.CharField(label="公司名稱",
    #                                required=True, min_length=2, max_length=20,
    #                                error_messages={
    #                                    "required": "此為必填欄位",
    #                                    "min_length": "輸入值不可少於2個字元",
    #                                    "max_length": "輸入值最大值不能超過20字元"
    #                                },
    #                                widget=forms.TextInput(
    #                                    attrs={"class": "form-control",
    #                                           "placeholder": "請輪入公司名稱"}
    #                                ))
    # address = forms.CharField(label="公司地址",
    #                           required=True, min_length=3, max_length=30,
    #                           error_messages={
    #                               "required": "此為必填欄位",
    #                               "min_length": "輸入值不可少於3個字元",
    #                               "max_length": "輸入值最大值不能超過30字元"
    #                           },
    #                           widget=forms.TextInput(
    #                               attrs={"class": "form-control",
    #                                      "placeholder": "請輪入公司地址"}
    #                           ))
    # number = forms.CharField(label="公司電話",
    #                          required=True, min_length=5, max_length=20,
    #                          error_messages={
    #                              "required": "確認密碼不能為空",
    #                              "min_length": "確認密碼不少於5個字元",
    #                              "max_length": "確認密碼不能大於20字元"
    #                          },
    #                          widget=forms.TextInput(
    #                              attrs={"class": "form-control",
    #                                     "placeholder": "請輸入公司電話"}
    #                          ))


class VerifyForm(forms.Form):
    def __init__(self, email, *args, **kwargs):
        super(VerifyForm, self).__init__(*args, **kwargs)
        self.fields['email'] = forms.CharField(
            label="電郵地址",
            required=True,
            max_length=100,
            initial=email,
            error_messages={
                "required": "電郵地址不能為空",
                "max_length": "電郵地址不能超過100字元"
            },
            widget=forms.TextInput(
                attrs={
                    "class": "form-control"
                }
            )
        )



class PasswordForm(forms.Form):
    user_name = forms.CharField(required=True, min_length=2, max_length=20,
                                error_messages={
                                    "required": "帳號不能為空",
                                    "min_length": "帳號不可少於2個字元",
                                    "max_length": "帳號不能大於20字元"
                                },
                                widget=forms.TextInput(
                                    attrs={"class": "form-control",
                                           "placeholder": "請輸入帳號",
                                           "autocomplete": "off"}
                                ))
    email = forms.CharField(required=True, min_length=5, max_length=30,
                            error_messages={
                                "required": "此為必填欄位",
                                "min_length": "輸入值不可少於5個字元",
                                "max_length": "輸入值最大值不能超過30字元"
                            },
                            widget=forms.TextInput(
                                attrs={"class": "form-control",
                                       "placeholder": "請輸入電子信箱"}
                            ))


class EditBase(forms.ModelForm):
    class Meta:
        model = Account
        fields = ('email',)
    # last_name = forms.CharField(label="姓氏",
    #                             required=True, max_length=10,
    #                             error_messages={
    #                                 "required": "姓氏不能為空",
    #                                 "max_length": "姓氏不能超過10個字元",
    #                             },
    #                             widget=forms.TextInput(
    #                                 attrs={"class": "form-control",
    #                                        "placeholder": "請輸入姓氏"}
    #                             ))
    # name = forms.CharField(label="名字",
    #                        required=True, max_length=50,
    #                        error_messages={
    #                            "required": "名稱不能為空",
    #                            "max_length": "名稱不能超過50個字元",
    #                        },
    #                        widget=forms.TextInput(
    #                            attrs={"class": "form-control",
    #                                   "placeholder": "請輸入名字"}
    #                        ))
    email = forms.CharField(label="電郵地址",
                            required=True , max_length=100,
                            error_messages={
                                "required": "電郵地址不能為空",
                                "max_length": "電郵地址不能超過100字元"
                            },
                            widget=forms.TextInput(
                                attrs={"class": "form-control",
                                       "placeholder":"請輸入電郵地址"}
                            ))


class NewPasswordForm(forms.Form):
    new_password = forms.CharField(label="新的密碼",
                                   required=True, min_length=4, max_length=20,
                                   error_messages={
                                       "required": "密碼不能為空",
                                       "min_length": "密碼不少於4個字元",
                                       "max_length": "密碼不能大於20字元"
                                   },
                                   widget=forms.PasswordInput(
                                       attrs={"class": "form-control",
                                              "placeholder": "請輸入密碼"}
                                   ))
    new_passwordConfirm = forms.CharField(label="再輸入一次新密碼",
                                          required=True, min_length=4, max_length=20,
                                          error_messages={
                                              "required": "密碼不能為空",
                                              "min_length": "密碼不少於4個字元",
                                              "max_length": "密碼不能大於20字元"
                                          },
                                          widget=forms.PasswordInput(
                                              attrs={"class": "form-control",
                                                     "placeholder": "請輸入密碼"}
                                          ))


class EditPassword(forms.ModelForm):
    class Meta:
        model = Account
        fields = ('password',)

    password = forms.CharField(label="舊的密碼",
                               required=True, min_length=4, max_length=20,
                               error_messages={
                                   "required": "密碼不能為空",
                                   "min_length": "密碼不少於4個字元",
                                   "max_length": "密碼不能大於20字元"
                               },
                               widget=forms.PasswordInput(
                                   attrs={"class": "form-control",
                                          "placeholder": "請輸入密碼"}
                               ))
    new_password = forms.CharField(label="新的密碼",
                               required=True, min_length=4, max_length=20,
                               error_messages={
                                   "required": "密碼不能為空",
                                   "min_length": "密碼不少於4個字元",
                                   "max_length": "密碼不能大於20字元"
                               },
                               widget=forms.PasswordInput(
                                   attrs={"class": "form-control",
                                          "placeholder": "請輸入密碼"}
                               ))
    new_passwordConfirm = forms.CharField(label="再輸入一次新密碼",
                               required=True, min_length=4, max_length=20,
                               error_messages={
                                   "required": "密碼不能為空",
                                   "min_length": "密碼不少於4個字元",
                                   "max_length": "密碼不能大於20字元"
                               },
                               widget=forms.PasswordInput(
                                   attrs={"class": "form-control",
                                          "placeholder": "請輸入密碼"}
                               ))

class EditMain(forms.ModelForm):
    class Meta:
        model = MainAccount
        fields = ('phone_number','real_name','bankaccount','transfer_name','company_name','tax_number')

    phone_number = forms.CharField(label="手機號碼",
                                   required=False, min_length=10, max_length=10,
                                   error_messages={
                                       'min_length': "手機號碼不少於10個字元",
                                       'max_length': "手機號碼不大於10個字元"
                                   },
                                   widget=forms.TextInput(
                                       attrs={"class": "form-control",
                                              "placeholder": "請輸入手機號碼",
                                              "value": "09"}
                                   ))
    real_name = forms.CharField(label="真實姓名",
                                required=False, min_length=2, max_length=50,
                                error_messages={
                                    'min_length': "真實姓名不少於2個字元",
                                    'max_length': "匯款人姓名不大於50個字元"
                                },
                                widget=forms.TextInput(
                                    attrs={"class": "form-control",
                                           "placeholder": "請輸入真實姓名",
                                           "id": "RealName"}
                                ))
    bankaccount = forms.CharField(label="帳戶後五碼",
                                     required=False, min_length=5, max_length=5,
                                     error_messages={
                                         "required":"帳戶後五碼不能為空",

                                         'max_length': "帳戶後五碼不少於5個字元"
                                     },
                                     widget=forms.TextInput(
                                          attrs={"class": "form-control",
                                                 "placeholder": "請輸入帳戶後五碼"}
                                     ))

    transfer_name = forms.CharField(label="匯款人姓名",
                                    required=False, min_length=2, max_length=50,
                                    error_messages={
                                        'min_length': "匯款人姓名不少於2個字元",
                                        'max_length': "匯款人姓名不大於50個字元"
                                    },
                                    widget=forms.TextInput(
                                        attrs={"class": "form-control",
                                               "placeholder": "請輸入匯款人姓名",
                                               "id": "transferName"}
                                    ))


    company_name = forms.CharField(label="公司名稱",
                                   required=False,min_length=2, max_length=50,
                                   error_messages={
                                       'min_length': "公司名稱不少於2個字元",
                                       'max_length': "公司名稱不大於50個字元"
                                   },
                                   widget=forms.TextInput(
                                       attrs={"class": "form-control",
                                              "placeholder": "請輸入名稱",
                                              "id": "CompanyName"}
                                   ))
    tax_number = forms.CharField(label="統一編號",
                              required=False,min_length=8, max_length=8,
                              error_messages={
                                  'min_length': "統一編號不少於8個字元",
                                  'max_length': "統一編號不大於8個字元"
                              },
                              widget=forms.TextInput(
                                  attrs={"class": "form-control",
                                         "placeholder": "請輸入統一編號",
                                         "id": "TaxNum"}
                              ))

    def clean_phone_number(self):
        data=self.cleaned_data['phone_number']
        if data =='':
            return None
        return data

    def clean_tax_number(self):
        data=self.cleaned_data['tax_number']
        if data =='':
            return None
        return data

    def clean_bankaccount(self):
        data=self.cleaned_data['bankaccount']
        if data =='':
            return None
        return data




