#!/usr/bin/env bash

SOURCE="${0%/*}"

kubectl delete -f "$SOURCE/../k8s/k8s-serv-deployment.yml"
