podTemplate(name: 'devops',label: 'devops', containers: [
  containerTemplate(name: 'docker', image: 'joao29a/jnlp-slave-alpine-docker',ttyEnabled: true, command: 'cat'),
  containerTemplate(name: 'nodejs', image: 'node:alpine', ttyEnabled: true, command: 'cat')
],
volumes: [
  hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')],
 {
 node ('devops') {
   environment {
   
   DOCKER_IMAGE_NAME = "burk1212/k8be-nodejs"
   }
   
    stage('checkout and Installing docker') {
	 git 'https://github.com/link78/mean_app-demo.git'
      container('nodejs') {
	 sh 'node --version'
         sh 'apk update && apk add docker'
         sh 'docker --version'
        
      }
    }
    stage ('Build App') {
      container('nodejs') {
      sh 'npm install'
      sh 'npm install -g @angular/cli'
      }
    }
	 
	 
	 
    stage('Build Docker Image') {
      container('nodejs') {
  sh 'docker --version'
	sh 'docker build -t $DOCKER_HUB_USR/k8be-nodejs .'
	sh 'docker login -u $DOCKER_HUB_USR -p $DOCKER_HUB_PASSWD'
	sh 'docker push $DOCKER_HUB_USR/k8be-nodejs' 
        
      }
    }
 // stage('Deploy to Kube'){
    
    // kubernetesDeploy(
       //  kubeconfigId: 'kubeConfig_id',
        // configs: 'kube-nodejs.yml',
        // enableConfigSubstitution: true
        
     //  )
        
        
      
  // }
	 
 }

})
