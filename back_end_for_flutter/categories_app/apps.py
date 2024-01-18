from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class CategoriesAppConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'categories_app'
    verbose_name = _("Categories App")
