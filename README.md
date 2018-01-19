This repo conatins the code for Simple NodeJs hello world Application and K8s Cluter creation and Deployment of containers on it

# Building your image
$ docker build -t username/node-web-app .

# List the Docker Images
$ docker images

# Run the image
docker run -p 4040:8080 -d username/node-web-app

# Get container ID
$ docker ps

# Print app output
$ docker logs <container id>

# Example
Running on http://localhost:8080

If you need to go inside the container you can use the exec command:
# Enter the container
$ docker exec -it <container id> /bin/bash

# Test Your Application
$ docker ps

ecce33b30ebf  <your username>/node-web-app:latest  npm start  ...   49160->8080

$ curl -i localhost:49160

# Reference Link: https://nodejs.org/en/docs/guides/nodejs-docker-webapp/

# =========

 # Steps for Kuberenets
 
 Create a Route53 domain/subdomain/cert
 
 1) k8s-cluster.sh  --> creates a cluster
 2) 2_addons.sh     --> Created Dashboard UI
 3) 3_docker_registry_secretes.sh  --> Creates a secret for docker registry with username
 
 Now, Once the cluster is created and able to access the Kubernetes dashboard, It's time to deploy our container
 
 1) deployment.yaml --> Deploy the container into the POD
 2) service.yaml  --> Used to expose our container as external, So that we can access our application from outside, which
    is running inside the Kubernetes cluster
 
 Kubernetes All Commands:
 Link: https://kubernetes.io/docs/reference/kubectl/cheatsheet/
 
 
 
