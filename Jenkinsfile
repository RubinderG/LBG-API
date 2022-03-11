pipeline {
	agent any
	stages{
		stage('Build Image'){
			steps{
			sh 'docker build -t gcr.io/lbg-210222/LBGAPIrubinder:latest -t gcr.io/lbg-210222/LBGAPIrubinders:build-$BUILD_NUMBER .'
			}
		}
		stage('Push GCR'){
			steps{
            sh 'docker push gcr.io/lbg-210222/LBGAPIrubinder:build-$BUILD_NUMBER'
			sh 'docker push gcr.io/lbg-210222/LBGAPIrubinder:latest'
			}
		}
		stage('Reapply '){
			steps{
			sh '''kubectl apply -f ./kubernetes/nginx.yaml
            kubectl apply -f ./kubernetes/api-deployment.yml
			'''
			}
		}
        stage('Cleanup'){
			steps{
            sh 'docker rmi gcr.io/lbg-210222/LBGAPIrubinder:latest'
			sh 'docker rmi gcr.io/lbg-210222/LBGAPIrubinder:build-$BUILD_NUMBER'
			}
		}
    }
}
