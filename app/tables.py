from django.utils.translation import gettext_lazy as _
from django.urls import reverse
import django_tables2 as tables
from .models import Appointment, Purpose, Status


class AppointmentTable(tables.Table):

    class Meta:
        orderable = False
        model = Appointment
        template_name = "django_tables2/bootstrap.html"
        fields = ("date", "purpose", "status", )
        attrs = {'class': 'table table-hover shadow records-table'}
        # row_attrs = {
        #     "onClick": lambda record: f"document.location.href='{reverse('system:order-detail', kwargs={'pk': record.pk})}';"
        # }

    def render_purpose(self, value, record):
        return Purpose(record.purpose).label
    
    def render_status(self, value, record):
        return Status(record.status).label