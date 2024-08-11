pipeline {
    agent { label 'staging' }
    stages {
        stage('Build and deploy on Staging environement') {
            steps {
                echo 'SettingUp Database'
                sh '''
                sudo chmod +x *.sh
                ./DB-postgresql.sh
                '''
                echo 'SettingUp Python virtual environement...'
                sh '''
                ./envsetup.sh
                '''
                echo 'SettingUp Gunicorn...'
                sh '''
                ./gunicorn.sh
                '''
                echo 'SettingUp Nginx'
                sh '''
                ./nginx.sh
                '''
            }
        }
        stage('Build and deploy on Production environement') {
            agent { label 'prod2' }       
            steps {
                timeout(time:5, unit:'MINUTES') {
                    input message:'Approve PRODUCTION Deployment?'
                }
                echo 'Setup database'
                sh '''
                sudo chmod +x *.sh
                ./DB-postgresql.sh
                '''
                echo 'SettingUp Python virtual environement...'
                sh '''
                ./envsetup.sh
                '''
                echo 'SettingUp Gunicorn...'
                sh '''
                ./gunicorn.sh
                '''
                echo 'SettingUp Nginx'
                sh '''
                ./nginx.sh
                '''
            }
        }    
    }
}
