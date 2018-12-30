#!/usr/bin/env bash

SOURCE="${0%/*}"

kubectl apply -f "$SOURCE/../k8s/k8s-serv-namespace-snapshot.yml"
kubectl config set-context $(kubectl config current-context) --namespace=k8s-serv-snapshot
