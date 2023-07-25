from django.utils.deprecation import MiddlewareMixin

from django.shortcuts import render
from Accounts.required import get_user_info

class LoginMiddleware(MiddlewareMixin):
    def __int__(self, get_response):
        self.get_response = get_response

    def __call__(self, request,id):
        user = get_user_info(request)
        if user == "":
            return render(request, '404.html')
        else:
            response = self.get_response(request,id)
            return response

