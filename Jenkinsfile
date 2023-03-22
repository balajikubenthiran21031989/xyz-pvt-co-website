pipeline {
   agent none
   stages {
      stage('Source Code') {
         agent { label 'slave1' }
         steps {
            git 'https://github.com/balajikubenthiran21031989/xyz-pvt-co-website.git'
         }
      }
      stage('Build') {
         agent { label 'slave1' }
         steps {
            sh 'docker build /home/ubuntu/jenkins/workspace/test-website/ -t kkbalajius/capstone-project2'
            sh 'docker tag kkbalajius/capstone-project2 kkbalajius/capstone-project2'
            sh 'docker login -u "kkbalajius" -p "Kingwith8@l@j!" docker.io'
            sh 'docker push kkbalajius/capstone-project2'
            echo 'Building....'
         }
      }
      stage('Run container') {
         agent { label 'slave1' }
         steps {
            sh 'docker rm -f $(sudo docker ps -a -q)'
            sh 'docker run -d -p 80:80 --name=capstone-project-2 kkbalajius/capstone-project2'
         }
      }
      stage('Website test') {
         agent { label 'slave1' }
         steps {
            sh "hostname -I"
            sh "curl -I localhost:80"
            sh "ansible-playbook website-checker.yaml"
            sh "java -jar website-testcase.jar"
         }
      }
      stage('clean test server') {
         agent { label 'slave1' }
         steps {
            sh "ansible-playbook clean-docker.yaml"
         }
      }
      stage('Deploy to prod server') {
         agent { label 'slave2' }
         steps {
                    git 'https://github.com/balajikubenthiran21031989/xyz-pvt-co-website.git'
                    sh "kubectl delete -f deployment.yaml"
                    sh "kubectl delete -f service.yaml"
                    sh "docker rm -f \$(sudo docker ps -a -q)"
                    sh "docker rmi -f \$(docker images -q)"
                    sh "kubectl apply -f deployment.yaml"
                    sh "kubectl apply -f service.yaml"
                }
            }
        }
   }
