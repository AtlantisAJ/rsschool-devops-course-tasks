#!/bin/bash

NAMESPACE="monitoring"

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

kubectl create namespace $NAMESPACE || echo "Namespace already exists"

helm upgrade --install prometheus bitnami/kube-prometheus \
  --namespace $NAMESPACE \
  --create-namespace \
  --set prometheus.service.type=NodePort \
  --set alertmanager.service.type=NodePort \
  --set grafana.enabled=false

echo "✅ Prometheus install в namespace '$NAMESPACE'"
