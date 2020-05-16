#!/bin/bash
kubectl apply -f TestResultsVolume.yaml -n test
sleep 2
kubectl apply -f PVclaim.yaml -n test
sleep 2
kubectl apply -f Stub.yaml -n test
sleep 2
kubectl apply -f App.yaml -n test
sleep 2

kubectl exec -it system-under-test --namespace=test -- npm run unittests
kubectl exec -it system-under-test --namespace=test -- npm run integrationtests
kubectl exec -it system-under-test --namespace=test -- npm run uitests

kubectl exec -it system-under-test --namespace=test -- cat /home/node/app/tests/results/TEST-unittests.xml
kubectl exec -it system-under-test --namespace=test -- cat /home/node/app/tests/results/TEST-integrationtests.xml
kubectl exec -it system-under-test --namespace=test -- cat /home/node/app/tests/results/TEST-uitests.xml

kubectl delete -f App.yaml -n test
kubectl delete -f PVclaim.yaml -n test
#kubectl delete -f TestResultsVolume.yaml -n test
