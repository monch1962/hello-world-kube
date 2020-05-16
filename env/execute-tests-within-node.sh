#!/bin/bash
kubectl exec -it helloworld --namespace=test -- npm run unittests
kubectl exec -it helloworld --namespace=test -- npm run integrationtests
kubectl exec -it helloworld --namespace=test -- npm run uitests
