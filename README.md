# ONOS Implementation
### Prerequisite
- Linux machine (ubuntu 18.04 LTS preferebly )
- go 
- helm 
- kubectl 
- docker


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
```
### Installing onus-umbrella applications
#### Clone the repository and get inside the repo 

```
git clone https://github.com/onosproject/onos-helm-charts.git
cd onos-helm-charts
git checkout tags/onos-umbrella-1.1.20
```
#### onos-gui installation


```
cd onos-gui
helm install onos-gui .
cd ..
```
#### onos-topo installation


```
cd onos-topo
helm install onos-topo .
cd ..
```

#### onos-topo installation


```
cd onos-config
helm install onos-config .
cd ..
```

### Validate if all pods are ruuning 
```
kubectl -n micro-onos get pods
```
### Namespace 
![Namespace](img/ns.png "Title")

### Pods in kubesystem namespace 
![Namespace](img/kube-system.png "Title")

### Pods Running in micro-onos namespace
![Pods Running](img/onos_pod.png "Title")
