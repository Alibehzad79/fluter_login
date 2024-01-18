# Generated by Django 5.0 on 2024-01-03 00:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products_app', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='slug',
            field=models.SlugField(help_text='sample-title-slug', unique=True, verbose_name='Product Slug'),
        ),
        migrations.AlterField(
            model_name='product',
            name='status',
            field=models.CharField(choices=[('In Stock', 'In Stock'), ('Out of Stock', 'Out Of Stock')], default='In Stock', max_length=50, verbose_name='Product Status'),
        ),
    ]
