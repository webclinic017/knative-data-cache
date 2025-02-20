#!/bin/bash
docker rmi johnson684/manager:golang-socket -f
docker rmi dasbd72/data-serve:latest -f
docker rmi johnson684/image-scale:python-socket -f
docker rmi johnson684/image-recognition:python-socket -f
docker rmi johnson684/cache-deleter:python -f

cd manager-go
docker build -t johnson684/manager:golang-socket .
docker push johnson684/manager:golang-socket
cd ..

cd data-serve
docker build -t dasbd72/data-serve:latest .
docker push dasbd72/data-serve:latest
cd ..

cd cache-deleter
docker build -t johnson684/cache-deleter:python .
docker push johnson684/cache-deleter:python
cd ..

docker build -t johnson684/image-scale:python-socket -f image-scale/Dockerfile .
docker push johnson684/image-scale:python-socket

docker build -t johnson684/image-recognition:python-socket -f image-recognition/Dockerfile .
docker push johnson684/image-recognition:python-socket

## new

docker build -t johnson684/video-split:python -f video-split/Dockerfile .
docker push johnson684/video-split:python

docker build -t johnson684/video-transcode:python -f video-transcode/Dockerfile .
docker push johnson684/video-transcode:python

docker build -t johnson684/video-merge:python -f video-merge/Dockerfile .
docker push johnson684/video-merge:python

# pv
# kubectl apply -f yamls/pv.yaml
# kubectl apply -f yamls/pvc.yaml

kubectl apply -f yamls/pv-disk.yaml
kubectl apply -f yamls/pvc-disk.yaml

# memory storage
# kubectl delete -f yamls/apps.yaml
# kubectl delete -f yamls/manager.yaml
# kubectl delete -f yamls/data-serve.yaml
# kubectl delete -f yamls/cache-deleter.yaml


# kubectl apply -f yamls/apps.yaml
# kubectl apply -f yamls/manager.yaml
# kubectl apply -f yamls/data-serve.yaml
# kubectl apply -f yamls/cache-deleter.yaml

# disk storage
kubectl delete -f yamls/apps-disk.yaml
kubectl delete -f yamls/new-apps.yaml
kubectl delete -f yamls/manager-disk.yaml
kubectl delete -f yamls/data-serve-disk.yaml
kubectl delete -f yamls/cache-deleter-disk.yaml

kubectl apply -f yamls/apps-disk.yaml
kubectl apply -f yamls/new-apps.yaml
kubectl apply -f yamls/manager-disk.yaml
kubectl apply -f yamls/data-serve-disk.yaml
kubectl apply -f yamls/cache-deleter-disk.yaml


