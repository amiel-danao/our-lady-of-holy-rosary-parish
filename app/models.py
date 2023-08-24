import uuid

import os
from shutil import copyfile
from django.db import IntegrityError, models
from django.forms import ValidationError
from django.utils import timezone
from django.core.validators import MinValueValidator
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.utils import timezone
from django.utils.translation import gettext_lazy as _
from app.managers import CustomUserManager
from django.utils.http import int_to_base36
from smart_selects.db_fields import GroupedForeignKey, ChainedForeignKey
from dirtyfields import DirtyFieldsMixin
from django.core.management import call_command
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.db.models import Q
# from notifications.management.commands import save_notification


ID_LENGTH = 30
DEVICE_ID_LENGTH = 15

# cred = credentials.Certificate(os.path.join(os.path.dirname(os.path.dirname(__file__)), "church-firebase-adminsdk-4g25g-b8cd5d3052.json"))
# FIREBASE_APP = firebase_admin.initialize_app(cred)
# FIREBASE_DB = firestore.client()


def id_gen() -> str:
    """Generates random string whose length is `ID_LENGTH`"""
    return int_to_base36(uuid.uuid4().int)[:ID_LENGTH]


class Customer(models.Model):
    id = models.CharField(max_length=ID_LENGTH,
                          primary_key=True, default=id_gen)
    # Field name made lowercase.
    firstname = models.CharField(max_length=50, blank=True, null=True)
    # Field name made lowercase.
    middlename = models.CharField(max_length=50, blank=True, null=True)
    # Field name made lowercase.
    lastname = models.CharField(max_length=50, blank=True, null=True)
    mobile = models.CharField(max_length=15, blank=True, null=True)
    email = models.EmailField(
        max_length=254, unique=True, blank=False, null=False)
    picture = models.ImageField(
        upload_to='images/', blank=True, null=True, default='')

    def __str__(self):
        if not self.firstname and not self.lastname:
            return self.email
        return f'{self.firstname} {self.lastname}'

    @property
    def get_photo_url(self):
        if self.picture and hasattr(self.picture, 'url'):
            return self.picture.url
        else:
            return "/static/logo/app_icon.png"


class CustomUser(AbstractBaseUser, PermissionsMixin):
    id = models.CharField(max_length=ID_LENGTH,
                          primary_key=True, default=id_gen, editable=False)
    email = models.EmailField(_("email address"), unique=True, blank=False)
    firstname = models.CharField(max_length=50, blank=True, null=True)
    # Field name made lowercase.
    middlename = models.CharField(max_length=50, blank=True, null=True)
    # Field name made lowercase.
    lastname = models.CharField(max_length=50, blank=True, null=True)
    picture = models.ImageField(
        upload_to='images/', blank=True, null=True, default='')
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    date_joined = models.DateTimeField(default=timezone.now)

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = []

    objects = CustomUserManager()

    class Meta:
        verbose_name = "User"

    @property
    def get_photo_url(self):
        if self.picture and hasattr(self.picture, 'url'):
            return self.picture.url
        else:
            return "/static/logo/app_icon.png"

    def __str__(self):
        if self.firstname is None and self.lastname is None:
            return self.email
        return f'{self.firstname} {self.lastname}'

class Purpose(models.IntegerChoices):
    WEDDING = 1, "Wedding"
    BAPTISM = 2, "Baptism"
    FUNERAL = 3, "Funeral"


class Status(models.IntegerChoices):
    PENDING = 1, "Pending"
    CONFIRMED = 2, "Confirmed"
    DONE = 3, "Done"
    REJECTED = 4, "Rejected"

def validate_file_extension(value):
    import os
    from django.core.exceptions import ValidationError
    ext = os.path.splitext(value.name)[1]  # [0] returns path+filename
    valid_extensions = ['.pdf', '.doc', '.docx']
    if not ext.lower() in valid_extensions:
        raise ValidationError('Unsupported file extension.')

class Appointment(models.Model):
    user = models.ForeignKey(Customer, on_delete=models.CASCADE, blank=False)
    status = models.IntegerField(default=Status.PENDING, choices=Status.choices)
    status_description = models.TextField(default='Your appointment is not yet approved, just wait a few hours before getting approved, thank you.', blank=True, max_length=255, help_text="Describe the reason for changing the status")
    date = models.DateTimeField(default=timezone.now, blank=False)
    purpose = models.IntegerField(default=Purpose.WEDDING, choices=Purpose.choices)
    officiant = models.CharField(default='', max_length=50, blank=True, null=True, help_text='Name of Priest')
    number_of_attendees = models.PositiveIntegerField(default=0)

    #Wedding
    name_of_husband = models.CharField(default='', max_length=69, blank=True, null=True, help_text='Surname FirstName, MiddleName')
    name_of_wife = models.CharField(default='', max_length=50, blank=True, null=True, help_text='Surname FirstName, MiddleName')
    name_of_officer = models.CharField(default='', max_length=50, blank=True, null=True, help_text='Surname FirstName, MiddleName')
    name_of_first_witness = models.CharField(default='', max_length=50, blank=True, null=True, help_text='Surname FirstName, MiddleName')
    name_of_second_witness = models.CharField(default='', max_length=50, blank=True, null=True, help_text='Surname FirstName, MiddleName')
    
    husband_birth_certificate = models.FileField(blank=True, help_text="Submit the file: pdf, doc, docx", upload_to='birth_certificates/', validators=[validate_file_extension])
    wife_birth_certificate = models.FileField(blank=True, help_text="Submit the file: pdf, doc, docx", upload_to='birth_certificates/', validators=[validate_file_extension])

    #Baptism
    fathers_full_name = models.CharField(default='', max_length=50, blank=True, null=True, verbose_name='Father\'s Full Name', help_text='Surname FirstName, MiddleName')
    mothers_full_name = models.CharField(default='', max_length=50, blank=True, null=True, verbose_name='Mother\'s Full Name', help_text='Surname FirstName, MiddleName')
    address = models.CharField(default='', max_length=50, blank=True, null=True, help_text='Street, Brgy/Village, City/Town, Province')    
    godparents = models.CharField(default='', max_length=1024, blank=True, null=True, help_text='Name of God Parents, separated by new line')

    #Funeral
    deceased_full_name = models.CharField(default='', max_length=50, blank=True, null=True, verbose_name='Deceased Full Name', help_text='Surname FirstName, MiddleName')
    age = models.PositiveSmallIntegerField(validators=(MinValueValidator(0),), default=0)
    date_of_death = models.DateField(default=timezone.now)
    place_of_burial_cemetery = models.CharField(default='', max_length=50, blank=True, null=True,)
    # deacons = models.CharField(default='', max_length=50, blank=True, null=True, verbose_name='Deacon(s)')
    # lectors_or_readers = models.CharField(default='', max_length=50, blank=True, null=True, verbose_name='Lector(s) or Reader(s)')
    gift_bearers_for_the_offering = models.CharField(default='', max_length=50, blank=True, null=True,)
    prelude_music = models.CharField(default='', max_length=50, blank=True, null=True)
    placement_of_the_pall = models.CharField(default='', max_length=50, blank=True, null=True,)
    entrance_hymn = models.CharField(default='', max_length=50, blank=True, null=True,)
    opening_collect = models.CharField(default='', max_length=50, blank=True, null=True,)
    first_reading = models.CharField(default='', max_length=50, blank=True, null=True,)
    responsorial_psalm = models.CharField(default='', max_length=50, blank=True, null=True,)
    # musical_reading = models.CharField(default='', max_length=50, blank=True, null=True,)
    text_of_response = models.CharField(default='', max_length=50, blank=True, null=True,)
    second_reading = models.CharField(default='', max_length=50, blank=True, null=True,)
    death_certificate = models.FileField(blank=True, upload_to='death_certificates/', help_text="Submit the file: pdf, doc, docx", validators=[validate_file_extension])
    archived = models.BooleanField(default=False)

    def __str__(self):
        return f'{self.user.email} - {self.date}'

class ArchivedFile(models.Model):
    appointment = models.ForeignKey(Appointment, on_delete=models.CASCADE)
    archived_file = models.FileField(upload_to='archived_files/')
    archived_date = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ('appointment', 'archived_file')

    def __str__(self):
        return f'{self.appointment} - {self.archived_date}'

    @classmethod
    def archive_appointment(cls, appointment):
        file_fields = [
            ('husband_birth_certificate', appointment.husband_birth_certificate),
            ('wife_birth_certificate', appointment.wife_birth_certificate),
            ('death_certificate', appointment.death_certificate)
        ]

        archive_files_create = []

        
        for field_name, field_value in file_fields:
            if field_value:
                # existing_archive_file = ArchivedFile.objects.filter(**{f'appointment__{field_name}': field_value}).first()
                # if not existing_archive_file:
                archived_file = create_archived_file(field_value)
                archive_files_create.append(ArchivedFile(appointment=appointment, archived_file=archived_file))
                # try:
                #     ArchivedFile.objects.create(appointment=appointment, archived_file=archived_file)
                # except IntegrityError:
                #     pass

        existing_archived_files = set(
            ArchivedFile.objects.filter(archived_file__in=[inst.archived_file for inst in archive_files_create]).values_list('archived_file', flat=True)
        )
        archive_files_create = [inst for inst in archive_files_create if inst.archived_file not in existing_archived_files]

        ArchivedFile.objects.bulk_create(archive_files_create)
        # try:
        #     if appointment.husband_birth_certificate:
        #         archived_file = create_archived_file(appointment.husband_birth_certificate)
        #         ArchivedFile.objects.create(appointment=appointment, archived_file=archived_file)
        # except IntegrityError:
        #     pass
        
        # try:
        #     if appointment.wife_birth_certificate:
        #         archived_file = create_archived_file(appointment.wife_birth_certificate)
        #         ArchivedFile.objects.create(appointment=appointment, archived_file=archived_file)
        # except IntegrityError:
        #     pass

        # try:    
        #     if appointment.death_certificate:
        #         archived_file = create_archived_file(appointment.death_certificate)
        #         ArchivedFile.objects.create(appointment=appointment, archived_file=archived_file)
        # except IntegrityError:
        #     pass

@receiver(post_save, sender=Appointment)
def archive_appointment(sender, instance, created, **kwargs):
    if instance.archived:
        ArchivedFile.archive_appointment(instance)

def create_archived_file(original_file_path):
    file_path = original_file_path.path
    archived_folder = 'archived_files'  # Folder where archived files will be stored

    # Create the archived folder if it doesn't exist
    if not os.path.exists(archived_folder):
        os.makedirs(archived_folder)

    file_name = os.path.basename(file_path)
    archived_file_path = os.path.join(archived_folder, file_name)

    # Copy the file to the archived location
    copyfile(file_path, archived_file_path)

    return archived_file_path  # Return the archived file path