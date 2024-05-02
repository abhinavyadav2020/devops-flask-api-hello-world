pipeline {
    agent any
    
    environment {
        DOCKER_HUB_REPO = "mrabhinav2020/flask_docker_jenkins_hands_on"
        CONTAINER_NAME = "flask-hello-world-container"
        DOCKERHUB_CREDENTIALS=credentials('dockerhub-credentials')
    }
    
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'docker --help'
                sh 'docker build -t $DOCKER_HUB_REPO:1.0.0 .'
            }
        }

        // stage('Test') {
        //     steps {
        //         echo 'Testing..'
        //         sh 'docker stop $CONTAINER_NAME'
        //         sh 'docker rm -f $CONTAINER_NAME'
        //         sh 'docker run --name $CONTAINER_NAME $DOCKER_HUB_REPO bash'
        //     }
        // }

        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push') {
            steps {
                echo 'Pushing image..'
                sh 'docker tag DOCKER_HUB_REPO:1.0.0 $DOCKER_HUB_REPO:1.0.0'
                sh 'docker push $DOCKER_HUB_REPO:1.0.0'
            }
        }
    }
}
