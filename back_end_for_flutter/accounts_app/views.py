from django.shortcuts import render
from rest_framework.decorators import api_view, permission_classes
from rest_framework import permissions
from rest_framework import status
from rest_framework.response import Response
from django.contrib.auth.models import make_password
from rest_framework_simplejwt.tokens import AccessToken
from accounts_app.serializers import CustomUserSerializer
from accounts_app.models import CustomUser


# Create your views here.


@api_view(["POST"])
def sign_up(request):
    if request.method == "POST":
        user_password = request.data["password"]
        encrypt_passwod = make_password(password=user_password)
        request.data["password"] = encrypt_passwod
        serializer = CustomUserSerializer(data=request.data, many=False)
        if serializer.is_valid():
            serializer.save()
            return Response(data=serializer.data, status=status.HTTP_201_CREATED)
        return Response(
            data={"message": "User Field Created"}, status=status.HTTP_401_UNAUTHORIZED
        )


@api_view(["GET"])
@permission_classes([permissions.IsAuthenticated])
def get_user_info(request):
    user = request.user
    serializer = CustomUserSerializer(user, many=False)
    return Response(data=serializer.data, status=status.HTTP_200_OK)
