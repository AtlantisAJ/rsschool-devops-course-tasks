#!/bin/bash

NAMESPACE="monitoring"

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

kubectl create namespace $NAMESPACE || echo "Namespace already exists"

helm upgrade --install grafana bitnami/grafana \
  --namespace $NAMESPACE \
  --set service.type=NodePort \
  --set adminPassword=admin123 \
  --set datasources."datasources\.yaml".apiVersion=1 \
  --set datasources."datasources\.yaml".datasources[0].name=Prometheus \
  --set datasources."datasources\.yaml".datasources[0].type=prometheus \
  --set datasources."datasources\.yaml".datasources[0].url=http://prometheus-operated.monitoring.svc.cluster.local:9090 \
  --set datasources."datasources\.yaml".datasources[0].access=proxy \
  --set datasources."datasources\.yaml".datasources[0].isDefault=true

echo "✅ Grafana installed in namespace '$NAMESPACE' with password 'admin123'"
