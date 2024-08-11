#!/bin/bash

# setup python virtual environement

sudo apt install python3-pip -y

if [ -d 'env' ]; then

    echo 'virtual environement exist!'
else
    python3 -m venv env
fi

echo "$PWD"

source env/bin/activate

pip install -U pip 
pip install virtualenv
pip install -r requirements.txt --no-warn-script-location

# setup nginx log folder
if [ -d 'logs' ]; then

    echo 'logs folder exist!'
else
    mkdir logs
    touch logs/error.log logs/access.log
fi

sudo chmod -R 777 logs

deactivate
echo 'env setup finishes'


