#!/bin/bash

ID=$(uuidgen) && aws route53 create-hosted-zone --name $1 --caller-reference $ID | jq .DelegationSet.NameServers
