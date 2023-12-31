# Cluster role permissions for all namespaces
        1. create a role
            create
            view
            delete
            update 
        2. cluster role binding
            bind the role tom

# Kube cluster role create 
    kubectl create clusterrole --help

    kubectl create clusterrole dev-cr -verb=list,create,delete,update --resource="*" --dry-run=client -o yaml > clusterrole.yml

    kubectl apply -f clusterrole.yml

# create clusterrolebinding for user tom 
    kubectl create clusterrolebinding dev-crb --clusterrole=dev-cr --user=tom --dry-run=client -o yaml > crb_tom.yml

    kubectl apply -f crb_tom.yml

# See the cluster pods visibles or not 
    kubectl --kubeconfig=tom_config get pods --all-namespaces


# Authenticate the config file to do operations on the kubernetes system

        kubectl auth can-i create pod --as tom

        output : - yes

        as we have given full permision to the tom user can do anything in cluster for the core api-groups

# He can't touches the deployments.apps api-groups and others