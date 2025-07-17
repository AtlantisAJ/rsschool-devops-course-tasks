# Task 6: Application Deployment via Jenkins Pipeline

## Проект

Простое HTML-приложение, разворачиваемое в Kubernetes через Helm.

## Структура

- `app/` — HTML-файл
- `Dockerfile` — для сборки контейнера
- `helm-chart/` — Helm chart для деплоя
- `Jenkinsfile` — пайплайн Jenkins

## Пайплайн включает:

- Сборку (не требуется)
- Юнит-тесты (заглушка)
- Анализ SonarQube (заглушка)
- Сборку Docker-образа и пуш в GitHub Packages
- Helm-деплой в K8s
- Smoke test через `curl`

## Требования

- Jenkins с Docker и Helm
- K8s кластер
- Настроенный GitHub Token с доступом к `ghcr.io`

## GitHub Packages

Токен должен быть добавлен в Jenkins как credential с ID: `github-packages-token`.
