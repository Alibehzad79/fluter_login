from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class TagsAppConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'tags_app'
    verbose_name = _("Tags App")
