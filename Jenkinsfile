pipeline {
  agent any
  stages {
  stage('intialize') {
      steps {
        sh 'echo "PATH= ${PATH}'
      }
    }
  stage('Run Robot Tests') {
      steps {
        sh 'python3 --outputdir reports .'
        sh 'exit 0'
      }
    }
  }
}