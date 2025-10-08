# 02 – Imagen Distroless Node.js

## 1) Objetivo
Ejecutar Node.js en una imagen **ultraligera y segura** sin shell ni paquetes extra.

## 2) Fundamento teórico
- Distroless elimina bash y paquetes innecesarios → menor superficie de ataque.
- Imagen base mantenida por Google.

## 3) Pasos
1. Construir:  
   ```bash
   docker build -t app-distroless .
   ```
2. Correr:  
   ```bash
   docker run --rm -p 4000:4000 app-distroless
   ```

## 4) Validación
Abrir http://localhost:4000 → debe mostrar “Hello from Distroless”.

## 5) Limpieza
```bash
docker rm -f $(docker ps -aq --filter ancestor=app-distroless)
docker rmi app-distroless
```
