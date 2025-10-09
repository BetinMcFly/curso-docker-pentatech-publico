# 🗂️ Ejemplo — WordPress con MariaDB (simple, visual y persistente)

## 🎯 Objetivo

Levantar WordPress y MariaDB con un solo archivo `docker-compose.yml`, mostrando:

- Cómo Compose orquesta varios contenedores
- Cómo la red interna permite que WordPress hable con su base de datos
- Cómo los datos persisten aunque el contenedor se destruya

## 📁 Estructura

```
06-wordpress-compose/
├── docker-compose.yml
└── README.md
```

## ⚙️ Archivo principal

### docker-compose.yml

```yaml
version: "3.9"

services:
  db:
    image: mariadb:10.6
    container_name: wp-db
    environment:
      MARIADB_ROOT_PASSWORD: rootpass
      MARIADB_DATABASE: wordpress
      MARIADB_USER: wpuser
      MARIADB_PASSWORD: wppass
    volumes:
      - db_data:/var/lib/mysql
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "localhost"]
      interval: 5s
      timeout: 5s
      retries: 10

  wordpress:
    image: wordpress:latest
    container_name: wp-site
    ports:
      - "8080:80"
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: wpuser
      WORDPRESS_DB_PASSWORD: wppass
      WORDPRESS_DB_NAME: wordpress
    volumes:
      - wp_data:/var/www/html
    depends_on:
      db:
        condition: service_healthy

volumes:
  db_data:
  wp_data:
```

## ▶️ Pasos de ejecución

### 1. Levantar el entorno

En tu terminal, dentro de esta carpeta:

```bash
docker compose up -d
```

Verifica:

```bash
docker compose ps
```

Deberías ver algo como:

```
NAME       STATUS           PORTS
wp-db      running (healthy)
wp-site    running          0.0.0.0:8080->80/tcp
```

### 2. Abrir WordPress

Abre en tu navegador:

👉 **http://localhost:8080**

Verás el asistente de instalación de WordPress:

1. Selecciona idioma
2. Asigna nombre del sitio, usuario, contraseña y correo
3. Finaliza la instalación
4. Inicia sesión en el panel (`/wp-admin`)

✅ **¡Tu sitio WordPress está en línea!**

### 3. Validar persistencia

Detén y borra el contenedor de WordPress (sin borrar los volúmenes):

```bash
docker compose down
```

Levántalo otra vez:

```bash
docker compose up -d
```

Vuelve a **http://localhost:8080**
→ El sitio y tus datos siguen ahí.

Eso demuestra que los volúmenes `db_data` y `wp_data` mantienen la información.

### 4. Limpiar todo (opcional)

Si quieres borrar contenedores y datos:

```bash
docker compose down -v
```

## 🧠 Explicación técnica (breve para la clase)

> "Compose crea una red interna donde wordpress puede conectarse a db usando su nombre.
> Los datos se guardan en volúmenes persistentes para que no se pierdan al reiniciar.
> En la nube, este mismo patrón es lo que usamos para montar microservicios que dependen entre sí."

## ⚠️ Problemas comunes

| Error | Causa | Solución |
|-------|-------|----------|
| Error establishing a database connection | Base de datos aún no lista | Espera unos segundos; Compose usa healthcheck para reintentar |
| Puerto 8080 ocupado | Otro contenedor o servicio usando ese puerto | Cambia a `"8081:80"` |
| Datos se pierden tras reiniciar | Se borró con `down -v` | Usa solo `docker compose down` para conservar datos |

## ✅ Resultado final

- WordPress accesible desde el navegador
- Base de datos persistente
- Compose orquestando ambos contenedores
- Visual inmediato (la interfaz web)