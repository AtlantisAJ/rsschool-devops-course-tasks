# Task 5: Simple Application Deployment with Helm

## Description

This task involved the creation and deployment of a Flask service to a Kubernetes cluster using a Helm chart. The deployment was performed locally with Minikube. The application is accessible via a web browser and returns a simple string response.

## Project Structure

```
task_5/
├── README.md               # Project documentation
├── app/
│   ├── Dockerfile          # Docker image configuration
│   ├── main.py             # Flask application
│   ├── requirements.txt    # Application dependencies
│   └── flask-chart/        # Helm chart
│       ├── Chart.yaml
│       ├── values.yaml
│       └── templates/
│           ├── deployment.yaml
│           ├── service.yaml
│           └── …
└── screenshots/            # Application screenshots
├── 2025-07-07_12.17.29.png
├── 2025-07-07_13.15.15.png
├── 2025-07-07_13.15.33.png
└── helm_status_and_kubectl_get_pods.png
```

## Build and Deployment

### 1. Building the Docker Image

```bash
cd app
docker build -t flask-app .
```

### 2. Starting Minikube

```bash
minikube start
eval $(minikube docker-env)  # Directs Docker builds to the local Minikube cluster
```

### 3. Installing the Helm Chart

```bash
cd app
helm upgrade --install flask-app ./flask-chart
```

## Accessing the Application

To obtain the service address, use the following command:

```bash
minikube service flask-app-flask-chart
```

Example output:

```
|-----------|-----------------------|-------------|---------------------------|
| NAMESPACE |         NAME          | TARGET PORT |            URL            |
|-----------|-----------------------|-------------|---------------------------|
| default   | flask-app-flask-chart | http/8080   | http://192.168.49.2:30894 |
```

Alternatively, access via tunnel:

```
http://127.0.0.1:55340
```

## Expected Result

When accessing the service URL in a web browser, the following message is displayed:

```
Hello from Task 5 Flask app in Kubernetes
```

## Screenshots

| Screenshot                          | Description                              |
|-------------------------------------|------------------------------------------|
| 2025-07-07_13.15.15.png            | Browser access to the application        |
| 2025-07-07_12.17.29.png            | `curl localhost:8080` output             |
| helm_status_and_kubectl_get_pods.png | Helm status and pod information         |

## Technologies Used

- Python 3.9 + Flask
- Docker
- Kubernetes via Minikube
- Helm 3

## Notes

- The Flask application runs on `0.0.0.0:8080`.
- The Kubernetes service type is `NodePort`, as defined in the Helm chart.
- Port forwarding is facilitated using the `minikube service` command.
```
