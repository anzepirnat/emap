# Generated by Django 5.1.6 on 2025-03-06 08:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("emapp", "0003_alter_testtablemigration_some_field"),
    ]

    operations = [
        migrations.AddField(
            model_name="testtablemigration",
            name="blabla",
            field=models.CharField(default="default_value", max_length=20),
        ),
    ]
