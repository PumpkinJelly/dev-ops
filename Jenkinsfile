pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Klim'
        STUDENT_SURNAME = 'Fomin'
        STUDENT_GROUP   = 'IT2-2312'
        STUDENT_ID      = '37073'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "=== Checkout stage ==="
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo "=== Build stage ==="
                echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"
                echo "Group: ${STUDENT_GROUP}"
                echo "Student ID: ${STUDENT_ID}"
                sh 'ls -la'
            }
        }

        stage('Test') {
            steps {
                echo "=== Test stage ==="
                sh '''
                    test -f Fomin_Klim_info.txt && echo "✓ info file exists"
                    test -f scripts/Klim_Fomin_system.sh && echo "✓ script exists"
                    test -f Dockerfile && echo "✓ Dockerfile exists"
                    echo "All basic tests passed"
                '''
            }
        }

        stage('Docker Build') {
            steps {
                echo "=== Docker Build stage ==="
                sh 'docker build -t klim-fomin-devops .'
            }
        }

        stage('Docker Run') {
            steps {
                echo "=== Docker Run stage ==="
                sh '''
                    docker rm -f klim-fomin-container || true
                    docker run --name klim-fomin-container \
                        -e STUDENT_NAME=${STUDENT_NAME} \
                        -e STUDENT_SURNAME=${STUDENT_SURNAME} \
                        -e STUDENT_GROUP=${STUDENT_GROUP} \
                        -e STUDENT_ID=${STUDENT_ID} \
                        klim-fomin-devops
                '''
            }
        }
    }

    post {
        success {
            echo "Pipeline finished: SUCCESS"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}
