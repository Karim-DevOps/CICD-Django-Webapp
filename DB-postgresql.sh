#!/bin/bash

sudo apt update 
sudo apt upgrade -y 
sudo apt install python3-venv python3-dev libpq-dev curl -y
sudo apt install postgresql -y
sudo apt install postgresql-contrib -y

sudo -u postgres psql -c "CREATE DATABASE pollingdb"
sudo -u postgres psql -c "CREATE USER pollinguser WITH PASSWORD 'password2024'"
sudo -u postgres psql -c "ALTER ROLE pollinguser SET client_encoding TO 'utf8'"
sudo -u postgres psql -c "ALTER ROLE pollinguser SET default_transaction_isolation TO 'read committed'"
sudo -u postgres psql -c "ALTER ROLE pollinguser SET timezone TO 'UTC'"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE pollingdb TO pollinguser"
sudo -u postgres psql -c "\l"
sudo -u postgres psql -c "\du"
