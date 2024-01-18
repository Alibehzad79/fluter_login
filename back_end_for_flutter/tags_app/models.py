from django.db import models
from django.utils.translation import gettext_lazy as _


# Create your models here.


class Tag(models.Model):
    name = models.CharField(max_length=50, verbose_name=_("Tag Name"))
    slug = models.SlugField(verbose_name=_("Tag Slug"), help_text=_("sample-tag-slug"))

    class Meta:
        verbose_name = _("Tag")
        verbose_name_plural = verbose_name + "s"

    def __str__(self):
        return self.name
