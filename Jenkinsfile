pipeline {
    agent { label 'docker' }
    triggers {
        pollSCM('* * * * *')
    }
    environment {
        ENVIRONMENT = credentials('environment_name')
        NFS_IP      = credentials('nfs_ip')
    }
    stages {
        stage('Deploy') {
            steps {
                echo 'Deploy Jenkins'
                sh 'docker stack deploy -c docker-compose.yml jenkins'
            }
        }
    }
}