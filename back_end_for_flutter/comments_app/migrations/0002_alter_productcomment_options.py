# Generated by Django 5.0 on 2024-01-03 00:46

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('comments_app', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='productcomment',
            options={'ordering': ['-send_date'], 'verbose_name': 'Comment', 'verbose_name_plural': 'Comments'},
        ),
    ]
