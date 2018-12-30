#!/usr/bin/env bash

SOURCE="${0%/*}"

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended/kubernetes-dashboard.yaml
kubectl apply -f "$SOURCE/../k8s/dashboard-adminuser.yml"

kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')

open 'http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy//#!/overview?namespace=default'

kubectl proxy
