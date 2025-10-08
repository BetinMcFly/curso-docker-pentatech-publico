# 🐘 PostgreSQL + pgAdmin con Docker Compose

## 🎯 Objetivo

Demostrar cómo usar **Docker Compose** para orquestar múltiples contenedores:
- **PostgreSQL**: Base de datos
- **pgAdmin**: Interfaz web para administrar PostgreSQL

## 📚 Fundamento teórico

Docker Compose permite definir y ejecutar aplicaciones multi-contenedor usando un archivo YAML. En este ejemplo:
- Los contenedores se comunican a través de una red interna
- Los datos persisten usando volúmenes
- Las variables de entorno configuran la conexión

## ✅ Requisitos previos

- **Docker Desktop** o **Docker Engine** funcionando
- **Puertos libres**: 5432 (PostgreSQL), 8080 (pgAdmin)
- **Navegador web** para acceder a pgAdmin

## 🚀 Pasos de ejecución

### 1. Ejecutar con Docker Compose
```bash
docker-compose up -d
```

### 2. Verificar contenedores
```bash
docker-compose ps
```

### 3. Acceder a pgAdmin
- URL: http://localhost:8080
- Email: admin@pentatech.com
- Password: admin123

### 4. Conectar a PostgreSQL
- Host: postgres
- Port: 5432
- Username: postgres
- Password: postgres123

## 🔧 Comandos útiles

```bash
# Ver logs
docker-compose logs

# Detener servicios
docker-compose down

# Detener y eliminar volúmenes
docker-compose down -v
```

## 📊 Validación

1. **PostgreSQL**: Verificar que el contenedor esté corriendo
2. **pgAdmin**: Acceder a la interfaz web
3. **Conexión**: Crear conexión a la base de datos
4. **Datos**: Crear tablas y insertar datos de prueba

## 🧹 Limpieza

```bash
docker-compose down -v
docker system prune -f
```
