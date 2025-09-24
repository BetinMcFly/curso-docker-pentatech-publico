# 03 – Postgres + pgAdmin con Docker Compose

## 1) Objetivo
Levantar un stack de **dos servicios** con un solo archivo `docker-compose.yml`.

## 2) Fundamento teórico
- **Docker Compose** describe servicios, redes y volúmenes en YAML.
- Un `compose up -d` orquesta el conjunto.

## 3) Requisitos previos
- Docker + Docker Compose (v2) disponibles.
- Puerto 8084 libre (para pgAdmin).

## 4) Insumos y materiales
- `docker-compose.yml` (incluido en esta carpeta).

## 5) Pasos numerados
1. Levantar servicios:
   ```bash
   docker compose up -d
   ```
2. Ver estado:
   ```bash
   docker compose ps
   ```

## 6) Explicación
- `db` ejecuta Postgres 13 con password `secret`.
- `pgadmin` expone UI en `http://localhost:8084` con usuario y contraseña provistos por variables.

## 7) Validación
- Abrir `http://localhost:8084`
- Logearse con:
  - **Email:** `admin@pentatech.com`
  - **Password:** `admin`
- Agregar un servidor apuntando a host: `db` (puerto 5432) y password `secret`.

## 8) Problemas comunes
- **No abre pgAdmin:** puerto ocupado → cambia a `8086:80` en el compose.
- **No conecta a Postgres:** espera unos segundos; si no, revisa logs:  
  `docker compose logs db`

## 9) Limpieza
```bash
docker compose down -v
```

## 10) Buenas prácticas
- Versiona el `compose.yml` junto con tus apps.
- Usa variables de entorno (.env) para credenciales en equipos reales.
