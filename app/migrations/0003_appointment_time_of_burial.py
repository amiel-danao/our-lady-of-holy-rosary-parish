# Generated by Django 4.0.4 on 2023-12-19 10:17

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0002_remove_appointment_time_of_burial'),
    ]

    operations = [
        migrations.AddField(
            model_name='appointment',
            name='time_of_burial',
            field=models.TimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
    ]
