# 01 – Multi-stage Build

## 1) Objetivo
Reducir el tamaño de la imagen final separando la etapa de **construcción** de la de **ejecución**.

## 2) Fundamento teórico
- Multi-stage permite tener varias secciones `FROM` en un mismo Dockerfile.
- Así instalamos dependencias pesadas solo en la fase de build.

## 3) Pasos
1. Construir imagen:  
   ```bash
   docker build -t app-multi .
   ```
2. Ver tamaño:  
   ```bash
   docker images app-multi
   ```
3. Ejecutar:  
   ```bash
   docker run --rm -p 3000:3000 app-multi
   ```

## 4) Validación
Abrir http://localhost:3000 → debe mostrar “Hello from Multi-Stage Build”.

## 5) Limpieza
```bash
docker rm -f $(docker ps -aq --filter ancestor=app-multi)
docker rmi app-multi
```
