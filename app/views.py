
from django.db.models import Q
from django.views.generic.edit import CreateView
from django.utils.timezone import get_current_timezone
from datetime import datetime
from django.utils.timezone import make_aware
from app.context_processors import SCHEDULE_DATEFORMAT
from django_tables2 import SingleTableView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth import login
from django.shortcuts import render, redirect
from app.context_processors import CONTEXT
from app.forms import AppointmentForm, NewUserForm
from app.models import Appointment, CustomUser, Customer
from app.tables import AppointmentTable
from .serializers import CustomUserSerializer, CustomerImageSerializer, CustomerSerializer
from rest_framework import viewsets, mixins, generics
from rest_framework.decorators import api_view, action
from django.shortcuts import render
from django.http.response import JsonResponse
from rest_framework.parsers import JSONParser, MultiPartParser
from rest_framework.exceptions import ParseError
from django.shortcuts import get_object_or_404
from rest_framework import status
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
from django.http import HttpResponse
from django.template import loader
from django.urls import resolve, reverse
from django.contrib import messages
from django.contrib.auth.views import LoginView
import math
import time
import os
from agora_token_builder import RtcTokenBuilder
from django.templatetags.static import static


dirname = os.path.dirname(__file__)
filename = "our-lady-of-holy-parish-firebase-adminsdk-d950z-134e11285d.json"
filepath = os.path.join(
    dirname, f'../{filename}')

if not firebase_admin._apps:
    cred = credentials.Certificate(filepath)
    firebase_admin.initialize_app(cred)

database = firestore.client()

query_watch = None

@api_view(['GET', ])
def customer_list(request):
    if request.method == 'GET':
        customers = Customer.objects.all()

        customers_serializer = CustomerSerializer(customers, many=True)
        return JsonResponse(customers_serializer.data, safe=False)




class CustomerViewSet(viewsets.GenericViewSet, mixins.CreateModelMixin, mixins.RetrieveModelMixin, mixins.UpdateModelMixin):
    queryset = Customer.objects.all()
    serializer_class = CustomerSerializer


class UploadCustomerImageViewSet(viewsets.GenericViewSet, mixins.RetrieveModelMixin, mixins.UpdateModelMixin):
    queryset = Customer.objects.all()
    serializer_class = CustomerImageSerializer
    parser_classes = [MultiPartParser]


class CreateAppointmentView(LoginRequiredMixin, CreateView):
    model = Appointment
    form_class = AppointmentForm
    template_name = 'pages/appointment_form.html'

    def get_success_url(self):
        return reverse('appointment_list')
    
    def form_valid(self, form):
        user = Customer.objects.filter(email=self.request.user.email).first()
        form.instance.user = user
        return super(CreateAppointmentView, self).form_valid(form)

    # def post(self, request, *args, **kwargs):
        
    #     user = Customer.objects.filter(email=request.user.email).first()
    #     # owner = Customer.objects.filter(email=request.user.email).first()
    #     date = make_aware(datetime.strptime(
    #                 request.POST.get('date'), SCHEDULE_DATEFORMAT), timezone=get_current_timezone())
    #     Appointment.objects.create(user=user, date=date, purpose=request.POST.get('purpose'))
    #     return self.get(request, *args, **kwargs)


class AppointmentListView(LoginRequiredMixin, SingleTableView):
    model = Appointment
    table_class = AppointmentTable
    template_name = 'pages/appointment_list.html'
    per_page = 8


    def get_table_data(self):

        return Appointment.objects.filter(user__email=self.request.user.email)
    
    def get_context_data(self, **kwargs):
        context = super(AppointmentListView, self).get_context_data(**kwargs)
        
        context['form'] = AppointmentForm()
            
        return context


@api_view(['GET', ])
def veterinary_list(request):
    if request.method == 'GET':
        veterinaries = CustomUser.objects.all()

        veterinaries_serializer = CustomUserSerializer(veterinaries, many=True)
        return JsonResponse(veterinaries_serializer.data, safe=False)


def video_call(request, message_gc_id):
    if request.user is None or request.user.is_authenticated is False:
        return redirect('admin:index')

    template = loader.get_template('pages/video_call.html')
    
    receiver_id = ''
    receiver = "Other"
    try:
        receiver_id = message_gc_id.split('-')[1]
        receiver = Customer.objects.filter(id=receiver_id).first()
    except Exception:
        pass
    #Build token with account
    expiration_time_in_seconds = 3600
    currentTimestamp = time.time()
    privilege_expired_ts = currentTimestamp + expiration_time_in_seconds;
    token = RtcTokenBuilder.buildTokenWithAccount(CONTEXT['app_id'], CONTEXT['app_certificate'], message_gc_id, request.user.id, 1, privilege_expired_ts)

    context = {
        'message_gc_id': message_gc_id,
        'receiver': receiver
        # 'token': token
    }

    return HttpResponse(template.render(context, request))


class MyLoginView(LoginView):
    # form_class=LoginForm
    redirect_authenticated_user=True
    template_name='registration/login.html'

    def get_success_url(self):
        # write your logic here
        # if self.request.user.is_superuser:
        return reverse('index')# '/progress/'
        # return '/'


def register_request(request):
    context = {}
    if request.method == "POST":
        form = NewUserForm(request.POST)
        if form.is_valid():
            user = form.save()
            Customer.objects.create(email=user.email)
            login(request, user)
            return redirect("index")
        context['form_errors'] = form.errors
        messages.error(
            request, "Unsuccessful registration. Invalid information.")
    form = NewUserForm()
    context["register_form"] = form
    return render(request=request, template_name="registration/register.html", context=context)


def index(request):
    context = {}
    return render(request, 'pages/landing.html', context)

def gallery(request):
    images = []
    for i in range(1, 11):
        images.append(f'images/gallery/{i}.jpg')
    return render(request, 'pages/gallery.html', {"images": images})

def about(request):
    return render(request, 'pages/about.html')

def chat_all(request):
    if request.user is None or request.user.is_authenticated is False:
        return redirect('admin:index')

    template = loader.get_template('pages/chat.html')
    all_custmomers = Customer.objects.filter(~Q(email=request.user.email))
    receiver = None
    message_gc_id = None
    try:
        if request.user.is_staff:            
            receiver = CustomUser.objects.filter(is_staff=False).first()
            message_gc_id = f'{receiver.id}-{request.user.id}'
        else:
            receiver = CustomUser.objects.filter(is_staff=True).first()
            message_gc_id = f'{request.user.id}-{receiver.id}'
    except Exception:
        pass

    # pets = get_my_pets(receiver)

    context = {
        # "pets": pets,
        "contact_view": request.user.is_staff,
        "receiver": receiver,
        "contacts": all_custmomers,
        "message_gc_id": message_gc_id
    }

    if request.method == 'POST':
        send_message(request=request, receiver_id=receiver.id)

    return HttpResponse(template.render(context, request))

def chat(request, message_gc_id):
    if request.user is None or request.user.is_authenticated is False:
        return redirect('admin:index')

    template = loader.get_template('pages/chat.html')
    all_customers = CustomUser.objects.filter(~Q(email=request.user.email))
    receiver = None
    receiver_id = ''

    try:
        if request.user.is_staff:
            receiver_id = message_gc_id.split('-')[0]
            customer = Customer.objects.filter(id=receiver_id).first()
            receiver = CustomUser.objects.filter(email=customer.email).first()
            receiver_id = receiver.id
            message_gc_id = f'{receiver_id}-{request.user.id}'            
        else:
            receiver_id = message_gc_id.split('-')[1]
            receiver = CustomUser.objects.filter(id=receiver_id).first()
        
    except Exception:
        pass

    # pets = get_my_pets(receiver)

    context = {
        # "pets": pets,
        "receiver": receiver,
        "contacts": all_customers,
        "message_gc_id": message_gc_id
    }

    if request.method == 'POST':
        send_message(request=request, receiver_id=receiver_id)

    return HttpResponse(template.render(context, request))


def send_message(request, receiver_id):
    input_message = None
    if request is None or request.user is None or receiver_id is None:
        return
    message_gc_id = f'{request.user.id}-{receiver_id}'
    if(request.user.is_staff):
        message_gc_id = f'{receiver_id}-{request.user.id}'
    try:
        input_message = request.POST.get('input_message')

        if input_message is not None:
            current_milliseconds = str(math.trunc(time.time() * 1000))
            new_message = {
                u'content': input_message,
                u'timestamp': current_milliseconds,
                u'idFrom': request.user.id,
                u'idTo': receiver_id,
                u'type': 0
            }

            batch = database.batch()

            message_thread_reference = database.collection(
                u'messages').document(message_gc_id)
            batch.set(message_thread_reference, {
                u'timestamp': firestore.SERVER_TIMESTAMP}, merge=True)

            message_reference = database.collection(u'messages').document(message_gc_id).collection(
                message_gc_id).document(current_milliseconds)

            batch.set(message_reference, new_message, merge=True)

            batch.commit()
    except Exception as exception:
        print(exception)