# 02 – Despliegue en GKE

## 1) Objetivo
Ejecutar un contenedor en un clúster de Kubernetes en Google Kubernetes Engine.

## 2) Fundamento teórico
- GKE administra clústeres Kubernetes en la nube.
- Permite desplegar, escalar y exponer contenedores de forma empresarial.

## 3) Pasos
1. Crear clúster:  
   ```bash
   gcloud container clusters create app-cluster --num-nodes=2 --region us-central1
   gcloud container clusters get-credentials app-cluster --region us-central1
   ```
2. Construir y subir imagen:  
   ```bash
   gcloud builds submit --tag us-central1-docker.pkg.dev/TU_PROYECTO/docker-repo/app-gke
   ```
3. Desplegar en Kubernetes:  
   ```bash
   kubectl apply -f app.yaml
   ```
4. Verificar:  
   ```bash
   kubectl get pods
   kubectl get svc app-service
   ```

## 4) Validación
Abrir la IP externa de `app-service` en navegador → debe mostrar “Hello from GKE”.

## 5) Limpieza
```bash
kubectl delete -f app.yaml
gcloud container clusters delete app-cluster --region us-central1
```
