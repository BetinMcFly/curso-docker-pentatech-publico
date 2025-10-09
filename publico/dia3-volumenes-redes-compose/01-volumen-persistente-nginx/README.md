# 01 – Volumen persistente con Nginx

## 1) Objetivo
Demostrar que los datos **persisten** aunque el contenedor se elimine, usando un volumen nombrado.

## 2) Fundamento teórico
- Un contenedor es efímero; si lo borras, su sistema de archivos se pierde.
- Un **volumen Docker** es almacenamiento gestionado por Docker que **permanece** más allá del contenedor.

## 3) Requisitos previos
- Docker instalado y daemon en ejecución.

## 4) Insumos y materiales
- Script: `run.sh` (automatiza la demo).

## 5) Pasos numerados (CLI local)
1. Crear volumen: `docker volume create datos`
2. Crear contenedor Nginx montando el volumen:  
   `docker run -d --name webv -v datos:/app/data nginx:alpine`
3. Escribir dato dentro del contenedor:  
   `docker exec webv sh -c "echo 'Pentatech Rocks!' > /app/data/test.txt"`
4. Eliminar contenedor: `docker rm -f webv`
5. Crear un nuevo contenedor con el mismo volumen:  
   `docker run -d --name webv2 -v datos:/app/data nginx:alpine`
6. Leer el archivo persistente:  
   `docker exec webv2 cat /app/data/test.txt`

## 6) Explicación de cada paso
- (1) Crea el volumen “datos”.
- (2) Monta el volumen en `/app/data`; todo lo escrito ahí quedará fuera del ciclo de vida del contenedor.
- (3) Escribimos un archivo.
- (4) Eliminamos el contenedor (simula un incidente o redeploy).
- (5) Levantamos otro contenedor con el mismo volumen.
- (6) Verificamos que el archivo sigue allí.

## 7) Validación
El comando del paso 6 debe imprimir:
```
Pentatech Rocks!
```

## 8) Problemas comunes y solución
- **No ves el archivo:** confirma que **escribes y lees** en el mismo path del volumen (`/app/data`).
- **Permisos:** usa Alpine/Nginx con `sh`; si cambias de imagen, revisa permisos del directorio.
- **Volumen equivocado:** `docker volume ls` y `docker inspect webv2` (revisa sección `Mounts`).

## 9) Limpieza
```bash
docker rm -f webv2
docker volume rm datos
```

## 10) Buenas prácticas
- Usa **volúmenes nombrados** para datos críticos.
- Evita usar solo bind mounts locales en producción.
