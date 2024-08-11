# CICD-Django-Dev-to-Prod-ProjectV3
## Demo Project
## Overview

This project demonstrates a CI/CD pipeline for deploying a Django web application using bash scripts, Jenkins, and Gunicorn. It includes the setup of services and configuration for a seamless transition from development to production environments.

## Project Structure

1. **Database**: PostgreSQL
2. **Polling Demo Project**
   - **Bash Scripts**:
     - `envsetup.sh`: Sets up and configures the Python virtual environment.
     - `gunicorn.sh`: Sets up and configures the Gunicorn service.
     - `nginx.sh`: Configures Nginx to forward requests from the Gunicorn service.
3. **Web Server**:
   - **Nginx**: Configured to manage web traffic and forward requests.

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
   
### Auto Deployment with Jenkins
1. **Jenkins Job Configuration**:
   - **Job Name**: `django-project`
   - **Root Directory for Jenkins Workspace**: `/usr/jenkins/workspace/`
   - **Full Path**: `/usr/jenkins/workspace/django-project/`
2. Add the repository URL to your Jenkins server.
3. Click `Build Now` to initiate the deployment.
4. **Change `ALLOWED_HOSTS=<Your IP>`** in **`/usr/jenkins/workspace/django-project/polling/polling/.env`**

## CI/CD Pipeline

- **Staging and Production Servers**: This setup includes two servers staging, production. You can modify the Jenkins pipeline to suit your deployment needs by adjusting the `stage('Build and Deploy on Production Environment')` section.

## Feedback

We welcome your feedback! Feel free to submit issues, leave comments, or ask questions about the project.

