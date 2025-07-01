# Task 4: Deploying Jenkins via Helm on Minikube

This document provides instructions for deploying Jenkins on a Minikube cluster using Helm. 
The process includes setting up Minikube, installing Helm, adding the Jenkins Helm chart repository, 
deploying Jenkins, and verifying the installation by creating a Freestyle job that outputs "Hello world". 
Screenshots and relevant outputs are included for reference.

---

## Prerequisites

- **Minikube**: A local Kubernetes cluster must be installed and running.
- **Helm**: The Helm package manager for Kubernetes must be installed.
- **kubectl**: The Kubernetes command-line tool must be configured to interact with the Minikube cluster.

---

## Installation Steps

1. **Start Minikube**

   Ensure Minikube is running to provide a local Kubernetes environment:
   ```bash
   minikube start
   ```

2. **Install Helm**

   Verify that Helm is installed on your system. If not, follow the official Helm installation guide to set it up.

3. **Add Jenkins Helm Repository**

   Add the Jenkins Helm chart repository to your Helm configuration and update the repository list:
   ```bash
   helm repo add jenkins https://charts.jenkins.io
   helm repo update
   ```

4. **Create Namespace**

   Create a dedicated Kubernetes namespace for Jenkins to isolate resources:
   ```bash
   kubectl create namespace jenkins
   ```

5. **Install Jenkins**

   Deploy Jenkins using the Helm chart within the `jenkins` namespace:
   ```bash
   helm install jenkins jenkins/jenkins --namespace jenkins
   ```

6. **Verify Installation**

    - Access Jenkins via the web interface at `http://localhost:8080`. You may need to use `minikube service` to expose the Jenkins service:
      ```bash
      minikube service jenkins --namespace jenkins
      ```
    - Create a Freestyle job in Jenkins with a simple script that outputs "Hello world" to validate functionality.
    - Verify the deployment by checking the Kubernetes resources in the `jenkins` namespace:
      ```bash
      kubectl get all --namespace jenkins
      ```

## Artifacts

The following files are provided as evidence of successful deployment:

- **Screenshot**: `screenshots/jenkins_hello_world.png`  
  Displays the Jenkins Freestyle job configuration and output for the "Hello world" job.
- **Output File**: `screenshots/kubectl_get_all.png` , `kubectl_get_all.txt`  
  Contains the output of the `kubectl get all --namespace jenkins` command, listing all resources in the Jenkins namespace.

## Notes

- Ensure Minikube is properly configured with sufficient resources (CPU and memory) to handle the Jenkins deployment.
- The Jenkins admin password can be retrieved using the following command:
  ```bash
  kubectl exec -it --namespace jenkins $(kubectl get pods --namespace jenkins -l app.kubernetes.io/component=jenkins-master -o jsonpath="{.items[0].metadata.name}") -- cat /var/jenkins_home/secrets/initialAdminPassword
  ```
- For production environments, consider customizing the Helm chart values (e.g., persistence, resource limits) to meet specific requirements.
