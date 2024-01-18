from django.urls import path
from comments_app.views import product_comment

urlpatterns = [
    path('<slug:slug>/', product_comment, name='product-comment-list'),
]
