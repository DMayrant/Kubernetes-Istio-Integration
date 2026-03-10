# Istio Service mesh 
This service provides your workloads with additional 

- Observability 🔭
- mTLS 🔐
- Traffic Control 🎛️
- Policy Enforcement and Security  
  
# Installing Istio Service Mesh 🛜

git clone https://github.com/istio/istio.git

helm repo add istio https://istio-release.storage.googleapis.com/charts


# Updating repo 
helm repo update 


# Creating namespace and installing istio base chart and pod 📈

kubectl create namespace istio-system

helm install istio-base istio/base -n istio-system 

helm install istiod istio/istiod -n istio-system

# Label namespace 


kubectl label namespace default istio-injection=enable --overwrite


# Uninstall istio service-mesh and remove ns label 

kubectl label namespace default istio-injection=enable-

kubectl get ns -L istio-injection 

helm uninstall istio-base istio/base -n istio-system 




