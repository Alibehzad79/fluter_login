import datetime

from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from comments_app.serializers import CommentSerializer
from products_app.models import Product


# Create your views here.

@api_view(["GET", "POST"])
def product_comment(request, *args, **kwargs):
    slug = kwargs['slug']
    try:
        product = Product.objects.get(slug=slug)
    except:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == "GET":
        serializer = CommentSerializer(product.productcomment_set.filter(status='Published').all(), many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    if request.method == "POST":
        data = request.data
        data["send_date"] = datetime.datetime.now()
        serializer = CommentSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(status=status.HTTP_400_BAD_REQUEST)
