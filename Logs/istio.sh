#!/bin/bash 
set -euo pipefail 

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
kubectl get ns -L istio-injection 
kubectl get ns default --show-labels 

# Uninstall istio service-mesh and remove ns label
helm uninstall istio-base istio/base -n istio-system  
kubectl label namespace default istio-injection=enable-




