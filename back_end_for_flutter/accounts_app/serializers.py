from rest_framework import serializers
from rest_framework.validators import UniqueValidator
from django.contrib.auth import get_user_model


class CustomUserSerializer(serializers.ModelSerializer):
    first_name = serializers.CharField(read_only=True)
    last_name = serializers.CharField(read_only=True)
    password = serializers.CharField(write_only=True)
    username = serializers.CharField(validators=[UniqueValidator(queryset=get_user_model().objects.all())])
    email = serializers.EmailField(validators=[UniqueValidator(queryset=get_user_model().objects.all())])
    class Meta:
        model = get_user_model()
        exclude = ('is_staff', 'is_active', 'groups', 'date_joined', 'user_permissions', 'last_login', 'is_superuser')
