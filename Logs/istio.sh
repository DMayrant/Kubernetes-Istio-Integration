#!/bin/bash 
set -euo pipefail 

# Installing Istio Service Mesh 🛜
echo "Installing Istio"
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
kubectl get ns -L istio-injection 
kubectl get ns default --show-labels 
echo "Install complete ✅"

# Uninstall istio service-mesh and remove ns label
echo "Uninstalling Istio"
helm uninstall istio-base istio/base -n istio-system  
kubectl label namespace default istio-injection=enable-
kubectl get ns default --show-lables
echo "Uninstall complete ✅"




