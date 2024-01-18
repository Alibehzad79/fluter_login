from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from products_app.serializers import ProductSerializer
from products_app.models import Product


# Create your views here.

@api_view(['GET'])
def product_list(request):
    products = Product.objects.all()
    serializer = ProductSerializer(products, many=True)
    if serializer.data:
        return Response(serializer.data, status=status.HTTP_200_OK)
    else:
        return Response(status=status.HTTP_204_NO_CONTENT)


@api_view(['GET', 'POST'])
def product_detail(request, *args, **kwargs):
    slug = kwargs['slug']
    try:
        product = Product.objects.get(slug=slug)
    except:
        return Response(status=status.HTTP_404_NOT_FOUND)
    serializer = ProductSerializer(product, many=False)
    return Response(serializer.data, status=status.HTTP_200_OK)
