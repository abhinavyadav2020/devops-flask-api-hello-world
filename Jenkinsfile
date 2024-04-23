pipeline {
    agent any
    
    environment {
        DOCKER_HUB_REPO = "mrabhinav2020/flask_docker_jenkins_hands_on"
        DOCKERHUB_CREDENTIALS=credentials('dockerhub-credentials')
    }
    
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'echo "admin" | sudo -S docker build -t $DOCKER_HUB_REPO:1.0.0 .'
            }
        }

        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push') {
            steps {
                echo 'Pushing image..'
                sh 'docker push $DOCKER_HUB_REPO:1.0.0'
            }
        }
    }
}
