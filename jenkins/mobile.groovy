def settings() {
    [
            'kubectlImage' : 'ssp25/ssp-kubectl:L1',
            'slackChannel' : 'devops-hyd-test',
            'slackChannelError' : 'devops-hyd-test'
    ]
}

// Branch tag needs to be updated as per the jenins JOB

def branchAndBuildTag() {
    return "${env.BRANCH_NAME}${env.BUILD_NUMBER}"
}
def branchTag() {
    return "${env.BRANCH_NAME}"
}


// Deploy Container
def deploymentUpdateSspWebNode(context, namespace, newVersion) {
    def cmd = "kubectl set image deployment/vpt-node-deployment vpt-node-deployment=${newVersion} --context=${context} --namespace=${namespace}"
    notify(cmd)

  //  sh "delivery/pearl-squad/artisan-mobile-bff/env/reload-secret.sh ${namespace} ${context}"

    sh cmd
}

def notify(message, color = '#C9C9C9') {
    def settings = settings()
    def updatedMessage = "(<${env.BUILD_URL}|Build>) `${JOB_NAME}:${env.BUILD_NUMBER}`\n${message}"
    echo updatedMessage
    slackSend(
            channel: settings.slackChannel,
            message: updatedMessage,
            color: good
    )
}

def notifyFailure(message) {
    def settings = settings()
    def updatedMessage = "(<${env.BUILD_URL}|Build>) `${JOB_NAME}:${env.BUILD_NUMBER}`\n Failed \n${message}"
    echo updatedMessage
    slackSend(
            color: 'danger',
            channel: settings.slackChannelError,
            message: updatedMessage
    )
}
