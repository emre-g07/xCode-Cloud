pipeline {
  agent {
    label 'macos'
  }
  environment {
    XCODE_WORKSPACE = 'YourProjectName.xcworkspace'
    XCODE_SCHEME = 'YourProjectName'
    XCODE_SDK = 'iphoneos'
    XCODE_CONFIGURATION = 'Release'
    XCODE_ARCHIVE_PATH = "${env.WORKSPACE}/build/${env.XCODE_SCHEME}.xcarchive"
    XCODE_IPA_PATH = "${env.WORKSPACE}/build/${env.XCODE_SCHEME}.ipa"
  }
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Build') {
      steps {
        sh "xcodebuild clean archive -workspace ${env.XCODE_WORKSPACE} -scheme ${env.XCODE_SCHEME} -sdk ${env.XCODE_SDK} -configuration ${env.XCODE_CONFIGURATION} -archivePath ${env.XCODE_ARCHIVE_PATH} -quiet"
      }
    }
    stage('Export IPA') {
      steps {
        sh "xcodebuild -exportArchive -archivePath ${env.XCODE_ARCHIVE_PATH} -exportPath ${env.XCODE_IPA_PATH} -exportOptionsPlist ExportOptions.plist -quiet"
      }
    }
    stage('Upload to App Store') {
      steps {
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'app_store_credentials', usernameVariable: 'APP_STORE_USERNAME', passwordVariable: 'APP_STORE_PASSWORD']]) {
          sh "altool --upload-app -f ${env.XCODE_IPA_PATH} -u ${APP_STORE_USERNAME} -p ${APP_STORE_PASSWORD} -t ios -v"
        }
      }
    }
  }
}