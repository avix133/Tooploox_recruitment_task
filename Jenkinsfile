def WATCHED_DIRNAME = 'watch-me'

IS_YAML_UPDATED_AND_VALID = false

pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
            // label "dbpe_gcp_${params.ENVIRONMENT}"
            additionalBuildArgs '--build-arg UID=$(id -u) --build-arg GID=$(id -g) --build-arg HOME_DIR=${WORKSPACE}'
        }
    }

    stages {
        stage('Test') {
            // when { changeset pattern: "${WATCHED_DIRNAME}\/.*\.(yml|yaml)$", caseSensitive: false, comparator: "REGEXP" }
            // when { 
            //     anyOf {
            //         changeset pattern: "${WATCHED_DIRNAME}/*.yml", caseSensitive: false 
            //         changeset pattern: "${WATCHED_DIRNAME}/*.yaml", caseSensitive: false 
            //     }
            // }
            steps {
                echo 'Hello World'
                script {
                    IS_YAML_UPDATED_AND_VALID = true
                }
            }
        }
        stage('Deploy') {
            when { 
                expression { IS_YAML_UPDATED_AND_VALID }
            }
            environment {
                CLOUDSDK_CORE_PROJECT = "tooploox-302721"
            }
            steps {
                withCredentials([file(credentialsId: 'tooploox_gcp_sa', variable: 'GCP_KEY')]) {
                    sh 'gcloud auth activate-service-account --key-file=' + GCP_KEY
                    sh 'gcloud container clusters list'
                }
            }
        }
    }
}
