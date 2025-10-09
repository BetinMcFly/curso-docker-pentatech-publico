# 🐬 MySQL + Adminer con Docker Compose

## 🎯 Objetivo

Demostrar cómo usar **Docker Compose** para orquestar múltiples contenedores:
- **MySQL**: Base de datos
- **Adminer**: Interfaz web ligera para administrar MySQL

## 📚 Fundamento teórico

Docker Compose permite definir y ejecutar aplicaciones multi-contenedor usando un archivo YAML. En este ejemplo:
- Los contenedores se comunican a través de una red interna
- Los datos persisten usando volúmenes
- Las variables de entorno configuran la conexión

## ✅ Requisitos previos

- **Docker Desktop** o **Docker Engine** funcionando
- **Puertos libres**: 3306 (MySQL), 8080 (Adminer)
- **Navegador web** para acceder a Adminer

## 🚀 Pasos de ejecución

### 1. Ejecutar con Docker Compose
```bash
docker-compose up -d
```

### 2. Verificar contenedores
```bash
docker-compose ps
```

### 3. Acceder a Adminer
- URL: http://localhost:8080
- Sistema: MySQL
- Servidor: mysql
- Usuario: root
- Contraseña: root123
- Base de datos: (dejar vacío)

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

1. **MySQL**: Verificar que el contenedor esté corriendo
2. **Adminer**: Acceder a la interfaz web
3. **Conexión**: Conectar a la base de datos MySQL
4. **Datos**: Crear tablas y insertar datos de prueba

## 🧹 Limpieza

```bash
docker-compose down -v
docker system prune -f
```
