# 🐳 Docker Cheatsheet - Pentatech

## 📋 Comandos Básicos
```
                    ##        .            
              ## ## ##       ==            
           ## ## ## ##      ===            
       /""""""""""""""""\___/ ===        
  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~   
       \______ o          __/            
         \    \        __/             
          \____\______/ 
```
### Información del sistema
```bash
docker --version              # Verificar versión de Docker
docker info                   # Información detallada del sistema
docker system df              # Espacio usado por Docker
docker system prune           # Limpiar recursos no utilizados
docker system info            # Información detallada del sistema
docker version                # Versión de Docker y API
```

### Ayuda y documentación
```bash
docker --help                 # Ayuda general
docker <comando> --help       # Ayuda específica de un comando
docker run --help             # Ejemplo: ayuda de docker run
```

---

## 🚀 Contenedores

### Crear y ejecutar contenedores
```bash
# Ejecutar contenedor básico
docker run hello-world

# Ejecutar contenedor interactivo
docker run -it ubuntu bash

# Ejecutar contenedor en segundo plano
docker run -d nginx

# Ejecutar con nombre personalizado
docker run --name mi-nginx nginx

# Ejecutar con variables de entorno
docker run -e MYSQL_ROOT_PASSWORD=123456 mysql

# Ejecutar con mapeo de puertos
docker run -p 8080:80 nginx
```

### Gestionar contenedores
```bash
# Listar contenedores en ejecución
docker ps

# Listar todos los contenedores (incluyendo detenidos)
docker ps -a

# Detener contenedor
docker stop <container_id>

# Iniciar contenedor detenido
docker start <container_id>

# Reiniciar contenedor
docker restart <container_id>

# Pausar contenedor
docker pause <container_id>

# Reanudar contenedor pausado
docker unpause <container_id>

# Renombrar contenedor
docker rename old-name new-name

# Eliminar contenedor
docker rm <container_id>

# Eliminar contenedor en ejecución (forzado)
docker rm -f <container_id>

# Eliminar todos los contenedores detenidos
docker container prune
```

### Interactuar con contenedores
```bash
# Ejecutar comando en contenedor en ejecución
docker exec -it <container_id> bash

# Ver logs del contenedor
docker logs <container_id>

# Seguir logs en tiempo real
docker logs -f <container_id>

# Ver logs con timestamp
docker logs -t <container_id>

# Ver últimas N líneas de logs
docker logs --tail 50 <container_id>

# Inspeccionar contenedor
docker inspect <container_id>

# Ver procesos en el contenedor
docker top <container_id>

# Ver puertos del contenedor
docker port <container_id>
```

---

## 🏗️ Imágenes

### Gestionar imágenes
```bash
# Listar imágenes locales
docker images

# Buscar imágenes en Docker Hub
docker search nginx

# Descargar imagen
docker pull nginx

# Etiquetar imagen
docker tag nginx:latest mi-nginx:v1.0

# Eliminar imagen
docker rmi <image_id>

# Eliminar imágenes no utilizadas
docker image prune

# Eliminar todas las imágenes no utilizadas
docker image prune -a
```

### Crear imágenes
```bash
# Construir imagen desde Dockerfile
docker build -t mi-app .

# Construir con tag específico
docker build -t mi-app:v1.0 .

# Construir con contexto específico
docker build -f Dockerfile.prod -t mi-app:prod .

# Guardar imagen como archivo
docker save -o imagen.tar nginx:latest

# Cargar imagen desde archivo
docker load -i imagen.tar
```

### Inspeccionar imágenes
```bash
# Ver historial de capas
docker history <image_name>

# Inspeccionar imagen
docker inspect <image_name>

# Ver tamaño de imagen
docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}"
```

---

## 📁 Volúmenes

### Gestionar volúmenes
```bash
# Listar volúmenes
docker volume ls

# Crear volumen
docker volume create mi-volumen

# Inspeccionar volumen
docker inspect mi-volumen

# Eliminar volumen
docker volume rm mi-volumen

# Eliminar volúmenes no utilizados
docker volume prune
```

### Usar volúmenes
```bash
# Montar volumen en contenedor
docker run -v mi-volumen:/data nginx

# Montar directorio del host
docker run -v /ruta/local:/ruta/contenedor nginx

# Montar archivo específico
docker run -v /ruta/archivo.conf:/etc/nginx/nginx.conf nginx
```

---

## 🌐 Redes

### Gestionar redes
```bash
# Listar redes
docker network ls

# Crear red personalizada
docker network create mi-red

# Inspeccionar red
docker inspect mi-red

# Ver detalles de red
docker network inspect mi-red

# Eliminar red
docker network rm mi-red

# Eliminar redes no utilizadas
docker network prune
```

### Conectar contenedores
```bash
# Ejecutar contenedor en red específica
docker run --network mi-red nginx

# Conectar contenedor existente a red
docker network connect mi-red <container_id>

# Desconectar contenedor de red
docker network disconnect mi-red <container_id>
```

---

## 🐙 Docker Compose

### Comandos básicos
```bash
# Levantar servicios
docker-compose up

# Levantar en segundo plano
docker-compose up -d

# Levantar servicios específicos
docker-compose up nginx mysql

# Detener servicios
docker-compose down

# Ver logs
docker-compose logs

# Ver logs de servicio específico
docker-compose logs nginx

# Seguir logs en tiempo real
docker-compose logs -f
```

### Gestionar servicios
```bash
# Construir imágenes
docker-compose build

# Reconstruir imágenes
docker-compose build --no-cache

# Ejecutar comando en servicio
docker-compose exec nginx bash

# Ejecutar comando en servicio nuevo
docker-compose run nginx bash

# Pausar servicios
docker-compose pause

# Reanudar servicios
docker-compose unpause

# Escalar servicio
docker-compose up --scale nginx=3

# Ver estado de servicios
docker-compose ps
```

---

## 🔧 Comandos Avanzados

### Limpieza del sistema
```bash
# Limpiar todo (¡CUIDADO!)
docker system prune -a --volumes

# Ver espacio usado
docker system df

# Limpiar solo contenedores
docker container prune

# Limpiar solo imágenes
docker image prune

# Limpiar solo volúmenes
docker volume prune

# Limpiar solo redes
docker network prune
```

### Debugging y troubleshooting
```bash
# Ver eventos del sistema
docker events

# Ver eventos en tiempo real
docker events --filter container=mi-nginx

# Ver estadísticas de contenedor
docker stats <container_id>

# Ver estadísticas de todos los contenedores
docker stats

# Ver estadísticas sin streaming
docker stats --no-stream

# Copiar archivos entre host y contenedor
docker cp archivo.txt <container_id>:/ruta/destino
docker cp <container_id>:/ruta/origen archivo.txt
```

### Variables de entorno
```bash
# Usar archivo .env
docker-compose --env-file .env up

# Pasar variables específicas
docker run -e VAR1=valor1 -e VAR2=valor2 nginx
```

---

## 🚀 Comandos para Producción

### Optimización
```bash
# Construir con cache
docker build --cache-from mi-app:latest -t mi-app:new .

# Construir imagen multi-stage
docker build -f Dockerfile.multi-stage -t mi-app:optimized .

# Verificar tamaño de imagen
docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}"
```

### Seguridad
```bash
# Ejecutar como usuario no-root
docker run --user 1000:1000 nginx

# Ejecutar en modo read-only
docker run --read-only nginx

# Ejecutar con capabilities específicas
docker run --cap-add=NET_ADMIN nginx

# Ejecutar con ulimits
docker run --ulimit nofile=1024:1024 nginx

# Ejecutar con security options
docker run --security-opt seccomp=unconfined nginx

# Limitar recursos
docker run --memory=512m --cpus=1 nginx

# Limitar memoria y CPU específicos
docker run --memory=1g --cpus=2 nginx
```

---

## 📚 Comandos Útiles para el Curso

### Desarrollo local
```bash
# Ejecutar servidor web simple
docker run -p 8080:80 nginx

# Ejecutar base de datos MySQL
docker run -e MYSQL_ROOT_PASSWORD=123456 -p 3306:3306 mysql

# Ejecutar Redis
docker run -p 6379:6379 redis

# Ejecutar PostgreSQL
docker run -e POSTGRES_PASSWORD=123456 -p 5432:5432 postgres
```

### Docker Compose para desarrollo
```bash
# Levantar stack completo
docker-compose up -d

# Ver logs de todos los servicios
docker-compose logs -f

# Reiniciar servicio específico
docker-compose restart nginx

# Ejecutar comando en servicio
docker-compose exec mysql mysql -u root -p
```

---

## 🎯 Comandos de Emergencia

### Cuando algo sale mal
```bash
# Detener todos los contenedores
docker stop $(docker ps -q)

# Eliminar todos los contenedores
docker rm $(docker ps -aq)

# Eliminar todas las imágenes
docker rmi $(docker images -q)

# Reiniciar Docker Desktop (macOS/Windows)
# Cerrar y abrir Docker Desktop

# Reiniciar Docker daemon (Linux)
sudo systemctl restart docker
```

---

## 📝 Notas Importantes

- **Siempre usa `docker-compose`** para aplicaciones multi-contenedor
- **Nombra tus contenedores** con `--name` para facilitar la gestión
- **Usa volúmenes** para persistir datos importantes
- **Limpia regularmente** con `docker system prune`
- **Nunca ejecutes como root** en producción
- **Usa imágenes oficiales** cuando sea posible
- **Documenta tus Dockerfiles** con comentarios claros

---

*Cheatsheet creado para el curso Docker Pentatech - ¡Pruébalo y practica! 🐳*
