# Task 6: Application Deployment via Jenkins Pipeline

## Overview

This project demonstrates deploying a simple HTML application via Jenkins pipeline to a Kubernetes cluster using Helm.

## Contents

- Simple HTML app located in `/app`
- Dockerfile to build container image
- Helm chart in `/helm-chart` for deployment
- Jenkins pipeline (Jenkinsfile) for CI/CD

## Pipeline Steps

1. Application build
2. Unit test execution (using Jest)
3. SonarQube security analysis (optional)
4. Docker image build and push to GitHub Container Registry (GHCR)
5. Helm deploy to Kubernetes cluster
6. Application verification (port-forward and curl)

## How to run locally

1. Build and run Docker image
2. Deploy Helm chart to your Kubernetes cluster
3. Use `kubectl port-forward` to access app at `localhost:8080`

## Screenshots

Screenshots of the working pipeline and deployed app are in `/screenshots`

## Notes

- Ensure Docker login to GHCR is configured
- Update Helm chart image repository if necessary

