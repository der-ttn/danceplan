# 🔐 GitHub Secrets Setup Guide

## Required Secrets

### 1. KUBE_CONFIG
```bash
# Kubeconfig für Production Cluster base64 encodieren
cat ~/.kube/config | base64 -w 0
```

### 2. SLACK_WEBHOOK (Optional)
```bash
# Slack Webhook URL für Notifications
https://hooks.slack.com/services/YOUR/SLACK/WEBHOOK
```

## Setup Steps

1. Gehe zu GitHub Repository → Settings → Secrets and variables → Actions
2. Klicke "New repository secret"
3. Füge die Secrets hinzu:
   - Name: `KUBE_CONFIG`
   - Value: Base64-encoded kubeconfig
4. Wiederhole für alle anderen Secrets

## Permissions

Stelle sicher, dass die kubeconfig Files folgende Permissions haben:
- Namespace erstellen/verwalten
- Deployments erstellen/aktualisieren
- Services erstellen/verwalten  
- Ingress erstellen/verwalten
- HPA erstellen/verwalten
