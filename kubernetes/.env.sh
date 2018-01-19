#!/usr/bin/env bash

OSFAMILY=$(uname)
BUCKET_NAME=sspucket
K8S_VERSION=1.7.1
NODE_COUNT=2

# This network should have been created earlier via Terraform.
#NETWORK_CIDR=192.168.10.0/24
#INFRA_VPC_ID=vpc-cc47dfb4

# This key should have been created before
SECRETS_HOME=~/.ssh
SSH_KEY=${SECRETS_HOME}/cicd_servers.pub

# These are needed by kops commands
export NAME=local.get-kubes.tk
export DOMAIN=get-kubes.tk
export KOPS_STATE_STORE=s3://${BUCKET_NAME}
export AWS_S3_BUCKET=${BUCKET_NAME}
#export MASTER_SIZE=${MASTER_SIZE:-t2.micro}
#export ZONES=${ZONES:-"us-east-1a,us-east-1b,us-east-1c"}

#export AWS_PROFILE=kops
