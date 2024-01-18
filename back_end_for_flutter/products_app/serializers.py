from rest_framework import serializers

from products_app.models import Product


class ProductSerializer(serializers.ModelSerializer):
    category = serializers.SerializerMethodField()
    creator = serializers.SerializerMethodField()
    tags = serializers.SerializerMethodField()
    galleries = serializers.SerializerMethodField()

    class Meta:
        model = Product
        exclude = ["id", 'created_date', 'published_date']

    def get_category(self, obj):
        return {"name": obj.category.name, "slug": obj.category.slug}

    def get_creator(self, obj):
        return f"{obj.creator.first_name} {obj.creator.last_name}"

    def get_tags(self, obj):
        return [{"name": tag.name, "slug": tag.slug} for tag in obj.tags.all()]

    def get_galleries(self, obj):
        return ({"title": gallery.title, "image": gallery.image.url} for gallery in obj.galleries.all())
