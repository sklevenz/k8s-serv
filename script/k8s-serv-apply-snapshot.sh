#!/usr/bin/env bash

SOURCE="${0%/*}"

kubectl apply -f "$SOURCE/../k8s/k8s-serv-deployment-snapshot.yml"
