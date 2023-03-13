from django.core.management.base import BaseCommand, CommandError
# from app.models import DeviceToken, ImmunizationHistory
import os
import firebase_admin
from firebase_admin import firestore
from firebase_admin import credentials
from django.conf import settings
from django.utils.timezone import make_aware
import pytz
from app.models import DeviceToken, ImmunizationHistory


class Command(BaseCommand):
    help = 'Closes the specified poll for voting'

    def add_arguments(self, parser):
        parser.add_argument('pk', nargs='+', type=int)

    def handle(self, *args, **options):
        try:
            pk = options['pk'][0]
            obj = ImmunizationHistory.objects.get(pk=pk)
        
            dirname = os.path.dirname(__file__)
            filename = "church-firebase-adminsdk-4g25g-b8cd5d3052.json"
            filepath = os.path.join(
                dirname, f'../{filename}')

            if not firebase_admin._apps:
                cred = credentials.Certificate(filepath)
                firebase_admin.initialize_app(cred)

            database = firestore.client()
            reminder_message = f'Good day!\nDon\'t forget, your pet have an upcoming vaccination appointment on {obj.date.strftime("%B %d, %Y")} at {obj.date.strftime("%I:%M%p")}'

            device_tokens = list(DeviceToken.objects.filter(customer=obj.pet.owner).values_list('token', flat=True))
            database.collection(u'notifications').add({
                u'message': reminder_message,
                u'title': u'church Vaccine Update',
                u'user_id': obj.pet.owner.id,
                u'device_tokens': device_tokens,
                u'date': obj.date,
                u'read': u'no'
            })

            print('OK firebase')
        
        except ImmunizationHistory.DoesNotExist:
            print('Poll "%s" does not exist' % pk)
        except Exception as e:
            print(e)