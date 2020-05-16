#!/bin/bash
kubectl run helloworld --image=helloworld --port=8080 --env="DOMAIN=cluster" --namespace=test