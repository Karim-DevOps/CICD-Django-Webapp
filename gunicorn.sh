#!/bin/bash

source env/bin/activate

cd /usr/jenkins/workspace/django-project/polling

python3 manage.py makemigrations
python3 manage.py migrate
sudo rm -rf static/
python3 manage.py collectstatic

#sudo apt install expect -y
#sudo chmod +x *.sh
#./createsuperuser.sh

cd /usr/jenkins/workspace/django-project

sudo cp -rf gunicorn.socket /etc/systemd/system
sudo cp -rf gunicorn.service /etc/systemd/system

echo "$PWD"
deactivate

sudo systemctl daemon-reload
sudo systemctl start gunicorn

echo "Gunicorn has started."

sudo systemctl enable gunicorn

echo "Gunicorn has been enabled."

sudo systemctl restart gunicorn

sudo systemctl status gunicorn

