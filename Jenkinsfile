pipeline {
  agent {
      label 'qa pipeline'
  }
  environment {
    QA_SERVER = 'https://qa.application.com/'
    
  }
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
          post {
            always {
                script {
                  step(
                        [
                          $class              : 'RobotPublisher',
                          outputPath          : 'reports',
                          outputFileName      : '**/output.xml',
                          reportFileName      : '**/report.html',
                          logFileName         : '**/log.html',
                          disableArchiveOutput: false,
                          passThreshold       : 50,
                          unstableThreshold   : 40,
                          otherFiles          : "**/*.png,**/*.jpg",
                        ]
                    )
                }
            }       
        }
    }    
  }
}