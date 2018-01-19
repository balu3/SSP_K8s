#!/bin/bash
set -e
source .env.sh


kubectl --context=${NAME} create secret docker-registry ssp25 --docker-username=ssp25 --docker-password=Password@54321 --docker-email=shivaprasadsalugu25@gmail.com
