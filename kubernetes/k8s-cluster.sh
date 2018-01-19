#!/usr/bin/env bash

####################################
# Setup a Kubernetes cluster for SSP
#####################################

set -e

source .env.sh

create_k8s_cluster() {
  kops create cluster  \
  --node-count 2 \
  --zones ap-south-1a \
  --master-zones ap-south-1a \
  --node-size t2.micro \
  --master-size t2.micro \
  --kubernetes-version 1.4.4 \
  --network-cidr 172.31.0.0/16 \
  --vpc vpc-37bf9a5e \
  --ssh-public-key ${SSH_KEY} \
  --image ami-5d055232 \
  ${NAME}
}

create_k8s_cluster
