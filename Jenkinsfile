pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'devops-weather-app'
    }

    stages {
        stage('Clone web app repository') {
            steps {
                git branch: 'main', url: 'https://github.com/nickypelo/devops-weather-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Ensure Docker is available on the agent
                    dockerImage = docker.build(env.DOCKER_IMAGE)
                }
            }
        }

        stage('Build Angular App') {
            steps {
                script {
                    dockerImage.inside {
                        // Ensure Node.js and Angular CLI are installed in the Docker image
                        sh 'npm install'
                        sh 'ng build'
                        echo 'completed build'
                    }
                }
            }
        }
    }
}
