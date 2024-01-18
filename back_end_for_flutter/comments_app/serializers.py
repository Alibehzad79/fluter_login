from rest_framework import serializers

from comments_app.models import ProductComment


class CommentSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(write_only=True)
    send_date = serializers.DateTimeField(write_only=True)
    product_slug = serializers.SerializerMethodField()

    class Meta:
        model = ProductComment
        exclude = ["id", 'status']

    def get_product_slug(self, obj):
        return obj.product.slug