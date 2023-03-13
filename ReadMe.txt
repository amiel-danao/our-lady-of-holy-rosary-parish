Install vscode

Android
Install flutter sdk https://docs.flutter.dev/get-started/install/windows
Framework - Flutter
Dart -> programming language
Android Studio -> https://redirector.gvt1.com/edgedl/android/studio/install/2021.3.1.17/android-studio-2021.3.1.17-windows.exe
Open android studio > click more actions > Install the latest sdk with the highest API level
In the Sdk Tools tab install the ff: Android Build Tools, Command-line Tools, SDK platform-tools

Firebase -> used for authentication only, but not needed to be installed

Web
Python 3.9.13 - Programming language  https://www.python.org/ftp/python/3.9.13/python-3.9.13-amd64.exe
Checkbox should be checked for Add Python to PATH

Django 4.1.3 - Framework run this command ->  pip install Django

Download and install XAMPP https://sourceforge.net/projects/xampp/files/XAMPP%20Windows/8.2.0/xampp-windows-x64-8.2.0-0-VS16-installer.exe



Setup Web Source code
python --version //To check if the python was properly installed
python -m venv venv //Creates a virtual environment folder,
cd venv/Scripts -> Enter
activate -> Enter
cd ../.. -> Enter
pip install -r requirements.txt //this will install all dependencies

Open xampp 
Start Mysql and Apache
Click Mysql -> Admin
In Browser, Click New (to create a database)
type in database name : ourladyofholyrosaryparish$church_database
then Click create

In windows start menu type in: environment variables
Click Environment variables
Under System Variables add new
Variable name : DJANGO_ENV
Variable value : LOCAL

python manage.py makemigrations //creates a mapping of python classes into database
python manage.py migrate // this will perform the actual conversion of python classes into mysql database
python manage.py createsuperuser //this will create admin account


python manage.py runserver //This will run the web app

To save a backup json file:
python manage.py dumpdata app admin_interface.theme --indent=2 > backup.json

To load a backup json file:
python manage.py loaddata backup.json