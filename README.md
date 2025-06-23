# 🎭 TTN Festival Tanzplan Generator

[![Deploy](https://github.com/ORGANIZATION/ttn-tanzplan-generator/actions/workflows/deploy.yml/badge.svg)](https://github.com/ORGANIZATION/ttn-tanzplan-generator/actions/workflows/deploy.yml)
[![Security](https://img.shields.io/badge/security-trivy-blue)](https://github.com/aquasecurity/trivy)

Festival Tanzplan Generator für **Techno Tanz Überprüfungsverein Nord e.V.**

## 🎯 Features

- ✅ 5-Tage Festival Planung
- ✅ Excel & PDF Export
- ✅ Multi-Stage Support
- ✅ Responsive Design
- ✅ TTN Branding

## 🚀 Deployment

### Automatisches Deployment via GitHub Actions

1. **Staging**: Automatisch bei Push zu `main`
2. **Production**: Manuell über GitHub Actions UI

### URLs

- **Staging**: https://staging.tanzplan.der-ttn.de
- **Production**: https://tanzplan.der-ttn.de

## 🔧 Lokale Entwicklung

```bash
# Repository klonen
git clone https://github.com/ORGANIZATION/ttn-tanzplan-generator.git
cd ttn-tanzplan-generator

# Docker Build
docker build -t ttn-tanzplan-generator .

# Lokal starten
docker run -p 8080:80 ttn-tanzplan-generator
```

## 📋 Repository Setup

1. **GitHub Secrets konfigurieren**:
   - `KUBE_CONFIG`: Base64-encoded kubeconfig für Production
   - `SLACK_WEBHOOK`: Optional für Notifications

2. **Container Registry**: GitHub Container Registry (ghcr.io)

3. **Domain konfigurieren**:
   - Production: `tanzplan.der-ttn.de`

## 🛡️ Security

- ✅ Container Image Scanning mit Trivy
- ✅ Non-root Container
- ✅ Security Headers
- ✅ HTTPS Redirect
- ✅ Rate Limiting

## 📊 Monitoring

```bash
# Pods überwachen
kubectl get pods -n ttn-tanzplan -l app=ttn-tanzplan-generator

# Logs anzeigen
kubectl logs -f deployment/ttn-tanzplan-generator -n ttn-tanzplan

# Ingress Status
kubectl get ingress -n ttn-tanzplan
```

---

**BASS. LIEBE. SICHERHEIT.** 🎵
