from django.db import models
from django.utils.translation import gettext_lazy as _


# Create your models here.

class Setting(models.Model):
    site_name = models.CharField(max_length=50, verbose_name=_("Site Name"))
    site_url = models.URLField(verbose_name=_("Site URL"), help_text="https://sitename.com/")
    site_owner_name = models.CharField(max_length=50, verbose_name=_("Site Owner Name"))
    about_site = models.TextField(verbose_name=_("About of Site"))

    class Meta:
        verbose_name = _("Setting")
        verbose_name_plural = verbose_name + "s"

    def __str__(self):
        return self.site_name


class ContactInfo(models.Model):
    setting = models.ForeignKey(Setting, on_delete=models.DO_NOTHING, verbose_name=_("setting"))
    title = models.CharField(max_length=50, verbose_name=_("contact name"), help_text=_("Phone"))
    value = models.CharField(max_length=100, verbose_name=_("09111111111"))

    class Meta:
        verbose_name = _("Contact Info")
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title


class SocialNetwork(models.Model):
    setting = models.ForeignKey(Setting, on_delete=models.DO_NOTHING, verbose_name=_("setting"))
    name = models.CharField(max_length=50, verbose_name=_("Network Name"), help_text=_("instagram"))
    url = models.URLField(help_text=_("https://instagram.com/username/"))

    class Meta:
        verbose_name = _("Social Network")
        verbose_name_plural = verbose_name + "s"

    def __str__(self):
        return self.name
