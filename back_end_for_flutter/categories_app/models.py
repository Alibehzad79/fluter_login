from django.db import models
from django.utils.translation import gettext_lazy as _


# Create your models here.


class Category(models.Model):
    name = models.CharField(max_length=50, verbose_name=_("Category Name"))
    slug = models.SlugField(verbose_name=_("Category Slug"), help_text=_("sample-category-slug"))

    class Meta:
        verbose_name = _("Category")
        verbose_name_plural = _("Categories")

    def __str__(self):
        return self.name
