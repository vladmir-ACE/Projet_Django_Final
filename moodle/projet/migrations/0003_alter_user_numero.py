# Generated by Django 4.2.3 on 2023-08-23 16:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('projet', '0002_tache'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='numero',
            field=models.IntegerField(null=True),
        ),
    ]
