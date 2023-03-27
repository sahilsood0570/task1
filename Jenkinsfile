pipeline {
    agent any
    stages {
        stage ('Build') {
            steps {
                sh 'printenv'
                
            }
        }
        stage ('Publish ECR') {
            steps {
                withEnv (["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}","AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}","AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) {
                    sh 'docker login -u AWS -p $(aws ecr-public get-login-password --region us-east-1) public.ecr.aws/l9h6y3f8'    
                    sh 'docker build -t sahil-testing .'      
                    sh 'docker tag sahil-testing:latest public.ecr.aws/l9h6y3f8/sahil-testing:""$BUILD_ID""'
                    sh 'docker push public.ecr.aws/l9h6y3f8/sahil-testing:""$BUILD_ID""'
                    
            }
        }
}
    }
}
