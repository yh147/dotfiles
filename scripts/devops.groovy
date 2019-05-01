#!groovy
pipeline {
    agent any

    environment {
        REPOSITORY="ssh://git@192.168.79.131:10022/yangh/smh-service.git"
        MODULE="smh-order"
        SCRIPT_PATH="/home/scripts"
    }

    stages {
        stage ('获取代码') {
            steps {
                echo "start fetch code from git:${REPOSITORY}"
                deleteDir()
                git "${REPOSITORY}"
            }
        }

        stage ('代码静态检查') {
            steps {
                echo "start check"
            }
        }

        stage ('编译') {
            steps {
                echo "start compile"
                sh "mvn -U -pl ${MODULE} -am clean package"
            }
        }

        stage ('构建镜像') {
            steps {
                echo "start build image"
                sh "${SCRIPT_PATH}/build-image.sh ${MODULE}"
            }
        }
    }
}
