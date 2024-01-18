from django.db import models
from django.contrib.auth import get_user_model
from django.utils.translation import gettext_lazy as _
from categories_app.models import Category
from tags_app.models import Tag


# Create your models here.

class Product(models.Model):
    class Status(models.TextChoices):
        in_stock = _("In Stock")
        out_of_stock = _("Out of Stock")

    creator = models.ForeignKey(get_user_model(), on_delete=models.DO_NOTHING, verbose_name=_("Creator"))
    title = models.CharField(max_length=50, verbose_name=_("Product Title"))
    image = models.ImageField(upload_to="images/products/", verbose_name=_("Image"), blank=True, null=True)
    slug = models.SlugField(verbose_name=_("Product Slug"), help_text=_("sample-title-slug"), unique=True)
    short_description = models.CharField(max_length=150, verbose_name=_("Product Short Description"))
    description = models.TextField(verbose_name=_("Product Description"))
    category = models.ForeignKey(Category, on_delete=models.DO_NOTHING, verbose_name=_("Product Category"))
    tags = models.ManyToManyField(Tag, verbose_name=_("Product Tags"))
    visit_count = models.IntegerField(default=0, verbose_name=_("Product Visitors Count"))
    created_date = models.DateTimeField(auto_now_add=False, auto_now=False, verbose_name=_("Product Created Date"))
    published_date = models.DateTimeField(auto_now_add=False, auto_now=False, verbose_name=_("Product Published Date"))
    status = models.CharField(max_length=50, choices=Status.choices, default=Status.in_stock,
                              verbose_name=_("Product Status"))

    class Meta:
        verbose_name = "Product"
        verbose_name_plural = verbose_name + "s"
        ordering = [
            '-published_date'
        ]

    def __str__(self):
        return self.title


class ProductGallery(models.Model):
    product = models.ForeignKey(Product, on_delete=models.DO_NOTHING, related_name=_("galleries"))
    title = models.CharField(max_length=50)
    image = models.ImageField(upload_to="galleries/", verbose_name=_("Galleries"), blank=True, null=True)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = _("Gallery")
        verbose_name_plural = _("Galleries")
        ordering = ["-id"]
