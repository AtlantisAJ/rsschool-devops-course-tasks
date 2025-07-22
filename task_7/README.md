# Task 7: Cluster Monitoring and Alerting

This project documents the setup of monitoring and alerting in a Kubernetes cluster using 
**Prometheus**, **Grafana**, and **Alertmanager**.

## 🛠️ Tools Used

- [Prometheus](https://prometheus.io/)
- [Grafana](https://grafana.com/)
- [Alertmanager](https://prometheus.io/docs/alerting/latest/alertmanager/)
- [Mailtrap](https://mailtrap.io/) – for email alert testing
- [Helm](https://helm.sh/) – for installing charts
- Kubernetes cluster (minikube or remote)

---

## ⚙️ Installation Process

### 1. Add Helm Repositories

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
````

### 2. Create Namespace

```bash
kubectl create namespace monitoring
```

### 3. Install Prometheus and Alertmanager

```bash
helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring
```

### 4. Install Grafana (optional if not included via kube-prometheus-stack)

```bash
helm install grafana grafana/grafana -n monitoring
```

### 5. Get Grafana Admin Password

```bash
kubectl get secret grafana-admin -n monitoring -o jsonpath="{.data.GF_SECURITY_ADMIN_PASSWORD}" | base64 --decode
```

Then open Grafana via port-forward:

```bash
kubectl port-forward svc/grafana 3000:80 -n monitoring
```

Access at: [http://localhost:3000](http://localhost:3000)

---

## 📊 Dashboards

Grafana dashboards were configured using the built-in Prometheus data source. A sample dashboard includes:

* Node CPU usage
* Memory usage
* Disk usage
* Kubernetes pod statuses

---

## 🚨 Alerts

### 1. Test Alert Rule Example

```yaml
# test-alert.yaml
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: test-alert-rule
  namespace: monitoring
spec:
  groups:
  - name: example
    rules:
    - alert: HighCPUUsage
      expr: 100 * (1 - avg(rate(node_cpu_seconds_total{mode="idle"}[1m])) by (instance)) > 80
      for: 1m
      labels:
        severity: warning
      annotations:
        summary: "High CPU usage detected"
        description: "CPU usage is above 80% for more than 1 minute."
```

Apply with:

```bash
kubectl apply -f test-alert.yaml
```

---

## ✉️ Email Alert Configuration

Mailtrap was used as a test SMTP server.

Create or edit `alertmanager-config.yaml`:

```yaml
global:
  smtp_smarthost: 'sandbox.smtp.mailtrap.io:2525'
  smtp_from: 'from@example.com'
  smtp_auth_username: 'YOUR_USERNAME'
  smtp_auth_password: 'YOUR_PASSWORD'

route:
  receiver: 'email-alert'

receivers:
  - name: 'email-alert'
    email_configs:
      - to: 'to@example.com'
```

Create secret with:

```bash
kubectl -n monitoring create secret generic alertmanager-prometheus-kube-prometheus-alertmanager \
  --from-file=alertmanager.yaml=alertmanager-config.yaml \
  --dry-run=client -o yaml | kubectl apply -f -
```

---

## ✅ Results

* Metrics successfully visualized in Grafana
* Test alert triggered and displayed in Grafana
* Email notification delivered to Mailtrap

---

## 📸 Screenshots

* Prometheus & Alertmanager pods running
* Grafana dashboard with live metrics
* Alert visible in Grafana Alerts page
* Email received in Mailtrap