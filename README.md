# ONOS Implementation
## Kind Cluster 
### Create a cluster 
```
kind create cluster --config config.yml
```
### setup the kubeconfig
```
kind get kubeconfig > ~/.kube/kind
```

### Create namespace 
```
kubectl create namespace micro-onos
```

## Install ONOS and its depenedencies 

### Setting up helm repo 
```
helm repo add cord https://charts.opencord.org
helm repo add atomix https://charts.atomix.io
helm repo add onosproject https://charts.onosproject.org
helm repo update
```
### Installing helm charts 
```
helm install -n kube-system atomix-controller atomix/atomix-controller
helm install -n kube-system atomix-raft-storage atomix/atomix-raft-storage
helm install -n kube-system onos-operator onosproject/onos-operator
helm -n micro-onos install onos-umbrella onosproject/onos-umbrella
```
### Validate if all pods are ruuning 
```
kubectl -n micro-onos get pods
```
