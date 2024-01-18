from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class CommentsAppConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'comments_app'
    verbose_name = _("Comments App")
