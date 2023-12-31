# Create service account for the applications authentications or others works
    kubectl create serviceaccount --help
    kubectl create serviceaccount dev-sa --dry-run=client -o yaml > dev-sa.yml

# Apply the sa configurations   
    kubectl apply -f dev-sa.yml

# create cicd role 
    kubectl create clusterrole cicd-role --verb=list,get,update,create --resource=deployments.apps,services --dry-run=client -o yaml > cicd-role.yml

# create clusterrolebinding for jenkins user

    kubectl create clusterrolebinding cicd-rb --clusterrole=cicd-role --serviceaccount=default:jenkins --dry-run=client -o yaml > cicd-rb.yml

    kubectl apply -f cicd-rb.yml


# create secrets to get intractive service with the jenkins user

    vim jenkins-token.yml

        apiVersion: v1
        kind: Secret
        type: kubernetes.io/service-account-token
        metadata:
          name: jenkins-token
          annotations:
            kubernetes.io/service-account.name: jenkins

# And run the command
        kubectl apply -f  jenkins-token.yml

# Last you can check the configuration of the jenkins are working fine or not using the custom config file 
    use the jenkins user config file
            kubectl --kubeconfig=jenkins.conf get pod
            kubectl --kubeconfig=jenkins.conf get pods
            kubectl --kubeconfig=jenkins.conf get deployments.apps
            kubectl --kubeconfig=jenkins.conf get service
            kubectl --kubeconfig=jenkins.conf list
            kubectl --kubeconfig=jenkins.conf list pod.yml
            kubectl auth can-i create pod --as jenkins
            kubectl auth can-i create service --as jenkins