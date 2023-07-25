from django import forms

class CreateMissionForm(forms.Form):
    mission_name = forms.CharField(label="任務名稱",
                                   required=True, min_length=5, max_length=50,
                                   error_messages={
                                       "required": "任務名稱不能為空",
                                       "min_length": "任務名稱不少於5個字母",
                                       "max_length": "任務名稱不能大於50字元"
                                   },
                                    widget=forms.TextInput(
                                        attrs={"class": "form-control",
                                                "placeholder": "請輸入任務名稱",
                                                "autocomplete": "off"}
                                    ))
