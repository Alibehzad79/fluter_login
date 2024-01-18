from django.urls import path
from products_app.views import product_list, product_detail

urlpatterns = [
    path('', product_list, name='products-list'),
    path('?<slug:slug>/', product_detail, name='product-detail'),
]
