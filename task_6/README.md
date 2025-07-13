# Task 6: Deployment to Kubernetes via Jenkins

## Description
The task involved setting up a Jenkins pipeline to deploy an application to a Kubernetes cluster using Helm.  
**Actual Result**: Due to technical difficulties with the local environment, the deployment was performed manually.

## Issues and Solutions

### Challenges Encountered
1. **Environment Conflicts**:
    - Docker Desktop and Minikube use different Docker daemons.
    - Jenkins lacked access to required tools (kubectl, helm).

2. **Deployment Errors**:
   ```bash
   ErrImagePull, ImagePullBackOff
   minikube: command not found
   ```

3. **Jenkins Plugin Issues**:
    - Lack of Docker access from the pipeline.
    - Required plugins (Slack, Kubernetes) were not installed.

### What Worked
1. Manual Docker Image Build:
   ```bash
   docker build -t task-6:latest .
   ```

2. Local Application Execution:
   ```bash
   docker run -p 8080:80 task-6
   ```
   Application accessible at: [http://localhost:8080](http://localhost:8080)

## Repository Structure
```
task_6/
├── helm-chart/          # Helm chart (not used due to errors)
│   ├── Chart.yaml
│   ├── values.yaml
│   └── templates/
├── Dockerfile           # Image configuration
├── index.html           # Application web page
└── Jenkinsfile          # Pipeline (requires refinement)
```

## How to Run (Alternative Method)
1. Build the image:
   ```bash
   docker build -t task-6 .
   ```

2. Run the container:
   ```bash
   docker run -p 8080:80 task-6
   ```

3. Verify:
   ```bash
   curl http://localhost:8080 | grep "Task 6 Application Deployment"
   ```

## Screenshots
Jenkins Dashboard (screenshots/Screenshot 2025-07-13 at 14.43.38)  
![Running Application](screenshots/Screenshot 2025-07-13 at 14.49.48.png)  
*Application page during local execution*

## Conclusion
The local environment (Docker Desktop + Minikube + Jenkins) proved too unstable for completing the task.  
In real-world projects, cloud-based Kubernetes clusters and CI/CD systems are used, where such issues are typically avoided.
