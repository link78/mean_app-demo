podTemplate(name: 'ng-devops',label: 'ng-devops',containers: [
containerTemplate(name: 'ng-node', image: 'circleci/node:9.3-stretch-browsers',ttyEnabled: true, command: 'cat')
],
volumes: [
hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
],
{
 node('ng-devops'){
 
  stage('Fecth dependencies'){
  git 'https://github.com/link78/mean_app-demo.git'
    container('ng-node') {
      sh 'yarn'
      stash includes: 'node_modules/', name: 'node_modules'
    }
  }
  stage('Lint') {
    container(ng-node){
       unstash 'node_modules'
       sh 'yarn lint'
    }
  }
stage('compile'){
  container('ng-node'){
       unstash 'node_modules'
        sh 'yarn build:prod'
        stash includes: 'dist/', name: 'dist'
  }
}
   stage('Build and Push Docker Image'){
    container('ng-node') {
        unstash 'dist'
        sh 'docker build -t $DOCKER_HUB_USR/ng-app .'
        sh 'docker login -u $DOCKER_PUSH_USR -p $DOCKER_HUB_PASSWD'
        sh 'docker push $DOCKER_HUB_USR/ng-app'
    }
   }
 }
}
);





 //   stage('Unit Test') {
 
     
      //  unstash 'node_modules'
     //   sh 'yarn test:ci'
     //   junit 'reports/**/*.xml'
     
  //  }
   // stage('E2E Test') {
      
    //    unstash 'node_modules'
      //  sh 'mkdir -p reports'
      //  sh 'yarn e2e:pre-ci'
      //  sh 'yarn e2e:ci'
      //  sh 'yarn e2e:post-ci'
      //  junit 'reports/**/*.xml'
      
   // }
    
