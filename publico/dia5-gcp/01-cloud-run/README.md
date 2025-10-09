# 01 – Despliegue en Cloud Run

## 1) Objetivo
Ejecutar una app Node.js en Cloud Run, directamente desde un contenedor.

## 2) Fundamento teórico
- Cloud Run es un servicio **serverless** que ejecuta contenedores bajo demanda.
- Escala automáticamente y cobra solo por ejecución.

## 3) Pasos
1. Autenticarse en GCP:  
   ```bash
   gcloud auth login
   gcloud config set project TU_PROYECTO
   ```
2. Construir imagen y subirla a Artifact Registry:  
   ```bash
   gcloud builds submit --tag us-central1-docker.pkg.dev/TU_PROYECTO/docker-repo/app-cloudrun
   ```
3. Desplegar en Cloud Run:  
   ```bash
   gcloud run deploy app-cloudrun \
     --image us-central1-docker.pkg.dev/TU_PROYECTO/docker-repo/app-cloudrun \
     --platform managed \
     --region us-central1 \
     --allow-unauthenticated
   ```

## 4) Validación
La consola te dará una URL pública.  
Abrir en navegador → debe mostrar “Hello from Cloud Run”.

## 5) Limpieza
```bash
gcloud run services delete app-cloudrun --region us-central1
```
