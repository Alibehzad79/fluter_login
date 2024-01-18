from django.contrib import admin
from site_settings_app.models import Setting, ContactInfo, SocialNetwork


# Register your models here.

class ContactInfoInline(admin.TabularInline):
    model = ContactInfo


class SocialNetworkInline(admin.TabularInline):
    model = SocialNetwork


@admin.register(Setting)
class SettingAdmin(admin.ModelAdmin):
    list_display = ['site_name', 'site_url']
    inlines = [ContactInfoInline, SocialNetworkInline]
