pipeline {
    agent: any

    environment {
        DOCKER_IMAGE = 'devops-weather-app'
    }

    stages {
        stage('Clone web app repository') {
            steps {
                git 'https://github.com/nickypelo/devops-weather-app'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Build Angular App') {
            steps {
                script {
                    dockerImage.inside {
                        sh 'npm install'
                        sh 'ng build'
                    }
                }
            }
        }
        stage('Serve Angular App') {
            steps {
                script {
                    dockerImage.inside {
                        sh 'ng serve --host 0.0.0.0'
                    }
                }
            }
        }

    }
}