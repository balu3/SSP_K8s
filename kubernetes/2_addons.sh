#!/usr/bin/env bash

source .env.sh

echo "Installing the Dashboard UI"
kubectl create -f https://raw.githubusercontent.com/kubernetes/kops/master/addons/kubernetes-dashboard/v1.4.0.yaml --context=${NAME} --validate=false

echo "Installing monitoring supports the horizontal pod autoscaler"
kubectl create -f https://raw.githubusercontent.com/kubernetes/kops/master/addons/monitoring-standalone/v1.2.0.yaml --context=${NAME} --validate=false

echo "Installing Nginx ingress"
kubectl create -f https://raw.githubusercontent.com/kubernetes/kops/master/addons/ingress-nginx/v1.4.0.yaml --context=${NAME} --validate=false

echo "Creating ssp-dev namespace"
kubectl create namespace ssp-dev
