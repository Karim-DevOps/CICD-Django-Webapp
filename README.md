# CICD-Django-Dev-to-Prod-ProjectV3
## Demo Project
## Overview

This project demonstrates a CI/CD pipeline for deploying a Django web application using bash scripts, Jenkins, and Gunicorn. It includes the setup of services and configuration for a seamless transition from development to production environments.

## Project Structured with Bash Scripts

1. **Database**: PostgreSQL
   - `DB-postgresql.sh`: Sets up and configures PostgreSQL Database
2. **Polling Demo Project**
   - `envsetup.sh`: Sets up and configures the Python virtual environment.
   - `gunicorn.sh`: Sets up and configures the Gunicorn service.
3. **Web Server**:
   - `nginx.sh`: Configures Nginx to forward requests from Gunicorn service.

## Prerequisites

1. **Ubuntu Server**
2. **Jenkins Server**

## Setup

### Manual Deployment

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Karim-DevOps/CICD-Django-Webapp.git
   cd CICD-Django-Webapp
   ```
2. **Change `ALLOWED_HOSTS=<Your IP>`** in **`CICD-Django-Webapp/polling/polling/.env`**

3. **Give Execute Permission to Scripts**
   ```bash
   sudo chmod +x *.sh
   ```
4. **Create Database**
   ```bash
   ./DB-postgresql.sh
   ```
5. **Set Up Python Virtual Environment**
   ```bash
   ./envsetup.sh
   ```
6. **Set Up Gunicorn Service**
   ```bash
   ./gunicorn.sh
   ```
7. **Set Up Nginx**
   ```bash
   ./nginx.sh
   ```
8. **Execute next command to create the `admin user`:**
  ```bash
  cd CICD-Django-Webapp/polling
  python3 manage.py createsuperuser 
  ```
9. **Access**
- **Access to the application**
   Open your browser and navigate to `http://localhost`.

- **Access to admin area**
   Open your browser and navigate to `http://localhost/admin`
   
### Auto Deployment with Jenkins
1. **Jenkins Job Configuration**:
   - **Job Name**: `django-project`
   - **Root Directory for Jenkins Workspace**: `/usr/jenkins/workspace/`
   - **Full Path**: `/usr/jenkins/workspace/django-project/`
2. Add the repository URL to your Jenkins server.
3. Click `Build Now` to initiate the deployment.
4. **Change `ALLOWED_HOSTS=<Your IP>`** in **`/usr/jenkins/workspace/django-project/polling/polling/.env`**
5. **Execute next command to create the `admin user`:**
  ```bash
  cd /usr/jenkins/workspace/django-project/polling
  python3 manage.py createsuperuser 
  ```
6. **Access**
- **Access to the application**
   Open your browser and navigate to `http://localhost`.

- **Access to admin area**
   Open your browser and navigate to `http://localhost/admin`
   

## CI/CD Pipeline

- **Staging and Production Servers**: This setup includes two servers staging, production. You can modify the Jenkins pipeline to suit your deployment needs by adjusting the `stage('Build and Deploy on Production Environment')` section.

## Feedback

We welcome your feedback! Feel free to submit issues, leave comments, or ask questions about the project.

