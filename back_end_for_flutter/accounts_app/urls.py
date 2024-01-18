from django.urls import path
from accounts_app.views import get_user_info, sign_up

urlpatterns = [
    path('signup/', sign_up, name="signup"),
    path("profile/", get_user_info, name="profile"),
]
