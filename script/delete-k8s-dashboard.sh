#!/usr/bin/env bash

SOURCE="${0%/*}"

kubectl delete -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended/kubernetes-dashboard.yaml
kubectl delete -f "$SOURCE/../k8s/dashboard-adminuser.yml"
