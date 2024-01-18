from django.contrib import admin
from products_app.models import Product, ProductGallery


class ProductGalleryInline(admin.TabularInline):
    model = ProductGallery


# Register your models here.

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ['title', 'slug', 'creator', 'created_date', 'published_date', 'status', 'visit_count']
    list_filter = ['created_date', 'published_date', 'status']
    search_fields = ['title', 'description', 'short_description', 'tags__name', 'tags__slug', 'category__name',
                     'creator__username', 'category__slug', 'slug']
    ordering = ['-published_date']
    list_editable = ("status",)
    inlines = [ProductGalleryInline]
