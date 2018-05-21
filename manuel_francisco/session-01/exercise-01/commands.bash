#!/bin/bash

export CLUSTER_IP="18.232.65.217"


# Nameservice
kubectl create ns exercise-01

# Secrets
kubectl create secret generic --namespace=exercise-01 mariadb-secrets --from-literal=mariadb-password=top-db-5ecre7
kubectl create secret generic --namespace=exercise-01 wordpress-secrets --from-literal=wordpress-password=top-wp-5ecre7

# ConfigMap
kubectl create -f ./cm.yaml

# Mariadb
kubectl create -f ./mariadb-deployment.yaml
kubectl create -f ./mariadb-svc.yaml

# Wordpress
kubectl create -f ./wordpress-deployment.yaml
kubectl create -f ./wordpress-svc.yaml

# Ingress
kubectl create -f ./ingress.yaml


# Tests
sleep 20s

curl --resolve "wordpress-exercise-01.com:80:$CLUSTER_IP" http://wordpress-exercise-01.com

