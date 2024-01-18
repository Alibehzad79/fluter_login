from django.db import models
from django.utils.translation import gettext_lazy as _
from products_app.models import Product


# Create your models here.

class ProductComment(models.Model):
    class Status(models.TextChoices):
        pending = _("Pending")
        published = _("Published")
        rejected = _("Rejected")

    product = models.ForeignKey(Product, on_delete=models.DO_NOTHING, verbose_name=_("Product"))
    name = models.CharField(max_length=50, verbose_name=_("Name"))
    email = models.EmailField(verbose_name=_("Email"))
    comment = models.TextField(verbose_name=_("Comment"))
    send_date = models.DateTimeField(auto_now=False, auto_now_add=False, verbose_name=_("Send Date"))
    status = models.CharField(max_length=50, choices=Status.choices, default=Status.pending, verbose_name=_("Status"))

    class Meta:
        verbose_name = _("Comment")
        verbose_name_plural = verbose_name + "s"
        ordering = ["-send_date"]

    def __str__(self):
        return self.name
