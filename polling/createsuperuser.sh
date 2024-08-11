#!/usr/bin/expect

spawn python3 manage.py createsuperuser

expect "Username (leave blank to use 'admin'):"
send "admin\r"

expect "Email address:"
send "admin@polling.com\r"

expect "Password:"
send "karimdevops\r"

expect "Password (again):"
send "karimdevops\r"

interact
