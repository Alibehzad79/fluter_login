# Generated by Django 5.0 on 2024-01-03 00:47

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('products_app', '0002_alter_product_slug_alter_product_status'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='product',
            options={'ordering': ['-published_date'], 'verbose_name': 'Product', 'verbose_name_plural': 'Products'},
        ),
    ]
