#!/usr/bin/env groovy

node {
    try {
        stage('Checkout') {
            checkout scm
        }
        stage('Build') {
            sh '''#!/bin/bash -l
                set -e
                cd .
                gem install bundler --no-document
                bundle install
            '''
        }
        stage('Test') {
            try {
                sh '''#!/bin/bash -l
                    set -e
                    cd .
                    bundle exec rake test
                '''
            } catch (e) {
                currentBuild.result = "FAILED"
                throw e
            }
        }
        stage('Deploy') {
            if (env.BRANCH_NAME == 'staging' || env.BRANCH_NAME == 'production') {
//                sh '''#!/bin/bash -l
//                    set -e
//                    cd .
//                    RAILS_ENV=test bundle exec rake assets:precompile
//                    ( cd public && tar cfz assets-$BRANCH_NAME.tar.gz assets)
//                '''
//                archiveArtifacts artifacts: 'public/assets-$BRANCH_NAME.tar.gz', excludes: null, onlyIfSuccessful: true
//                step([$class: 'S3BucketPublisher', dontWaitForConcurrentBuildCompletion: false,
//                      entries: [[bucket: 'code-20141030', excludedFile: '', flatten: true, gzipFiles: false,
//                                 keepForever: false, managedArtifacts: false, noUploadOnFailure: true,
//                                 selectedRegion: 'us-west-2', showDirectlyInBrowser: false,
//                                 sourceFile: 'public/assets-$BRANCH_NAME.tar.gz', storageClass: 'STANDARD',
//                                 uploadFromSlave: false, useServerSideEncryption: true]],
//                      profileName: 'excelcycle',
//                      userMetadata: []
//                ])
//                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'excelcycle']]) {
//                    sshagent(['b42298d7-6d44-4034-8ac9-50690a188270']) {
//                        sh '''#!/bin/bash -l
//                            set -e
//                            cd .
//                            echo "Deploying to $BRANCH_NAME"
//                            bundle exec cap $BRANCH_NAME deploy
//                        '''
//                    }
//                }
            }
        }
        stage('Cleanup') {
            echo 'Cleaning workspace (if successful)'
            step([$class: 'WsCleanup', deleteDirs: true, patterns: [[pattern: '.git/**', type: 'EXCLUDE']]])
        }
    } catch (e) {
        currentBuild.result = "FAILED"
        throw e
    } finally {
        def buildStatus = currentBuild.result ? currentBuild.result : 'SUCCESSFUL'
        def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
        def details = "${env.JOB_NAME} - Build # ${env.BUILD_NUMBER} - ${buildStatus}:\n" +
                "\n" +
                "Check console output at $BUILD_URL to view the results."
        emailext recipientProviders: [[$class: 'DevelopersRecipientProvider']],
                subject: subject,
                body: details
        slackSend subject + ": ${BUILD_URL}"
    }
}
