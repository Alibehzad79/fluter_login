# Generated by Django 5.0 on 2024-01-03 03:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products_app', '0003_alter_product_options'),
    ]

    operations = [
        migrations.CreateModel(
            name='Gallery',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=50)),
                ('image', models.ImageField(blank=True, null=True, upload_to='galleries/', verbose_name='Galleries')),
            ],
            options={
                'verbose_name': 'Gallery',
                'verbose_name_plural': 'Galleries',
                'ordering': ['-id'],
            },
        ),
        migrations.AddField(
            model_name='product',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='images/products/', verbose_name='Image'),
        ),
    ]
