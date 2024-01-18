from django.contrib import admin
from comments_app.models import ProductComment


# Register your models here.

@admin.register(ProductComment)
class ProductCommentAdmin(admin.ModelAdmin):
    list_display = ['name', 'email', 'send_date', 'status']
    list_filter = ['status', 'send_date']
    search_fields = ['name', 'email', 'comment', 'product']
    ordering = ['-send_date']
    list_editable = ("status",)
