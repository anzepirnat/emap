# Generated by Django 5.1.6 on 2025-03-06 08:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("emapp", "0002_testtablemigration"),
    ]

    operations = [
        migrations.AlterField(
            model_name="testtablemigration",
            name="some_field",
            field=models.IntegerField(),
        ),
    ]
