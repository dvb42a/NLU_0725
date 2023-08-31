from django.http import HttpResponse
from django.utils.deprecation import MiddlewareMixin
from django.shortcuts import render
from Apps.models import Apps

class CheckAppMiddleware(MiddlewareMixin):
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        app_name = request.GET.get('app')

        if app_name:
            try:
                app = Apps.objects.get(app_name=app_name)
                if app.state == 0:
                    return render(request, '404.html')
            except Apps.DoesNotExist:
                pass  # Handle the case where the app doesn't exist

        response = self.get_response(request)
        return response