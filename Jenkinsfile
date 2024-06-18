pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'devops-weather-app'
        DOCKER_CREDENTIALS_ID = 'dockerhub-credentials'
    }

    stages {
        stage('Clone web app repository') {
            steps {
                git branch: 'main', url: 'https://github.com/nickypelo/devops-weather-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    sh 'npm install'
                }
            }
        }

        // stage('Run Tests') {
        //     steps {
        //         script {
        //             sh 'npm test'
        //         }
        //     }
        // }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Deploy To DockerHub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        sh 'echo $PASSWORD | docker login --username $USERNAME --password-stdin'
                        sh "docker tag $DOCKER_IMAGE nicodemus0550/$DOCKER_IMAGE"
                        sh "docker push nicodemus0550/$DOCKER_IMAGE"
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
