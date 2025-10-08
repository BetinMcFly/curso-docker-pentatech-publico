# 03 – Usuario no root

## 1) Objetivo
Ejecutar contenedores con un usuario limitado en lugar de `root`.

## 2) Fundamento teórico
- Por defecto, los contenedores corren como root.
- Esto es un riesgo si alguien explota la app.
- Se recomienda usar un usuario sin privilegios.

## 3) Pasos
1. Construir imagen:  
   ```bash
   docker build -t app-noroot .
   ```
2. Correr contenedor:  
   ```bash
   docker run --rm app-noroot
   ```

## 4) Validación
El contenedor debe imprimir:  
```
Running as UID: 1001
```

## 5) Limpieza
```bash
docker rmi app-noroot
```
