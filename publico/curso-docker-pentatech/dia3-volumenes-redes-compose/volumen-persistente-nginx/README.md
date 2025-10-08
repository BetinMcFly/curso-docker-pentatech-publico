# 📦 Volumen persistente con Nginx

## 🎯 1) Objetivo

Demostrar cómo conservar archivos web aunque el contenedor se detenga o elimine, usando:

- **Volumen bind mount** (directorio del host)
- **Volumen nombrado** gestionado por Docker

## 📚 2) Fundamento teórico

Un contenedor es **efímero**: si lo borras, su sistema de archivos desaparece.
Un volumen desacopla los datos del ciclo de vida del contenedor:

- **Bind mount**: mapeas una carpeta del host dentro del contenedor
- **Volumen nombrado**: Docker administra la ubicación y el ciclo de vida del almacenamiento

**Ambos sobreviven a la eliminación del contenedor.**

## ✅ 3) Requisitos previos

- **Docker Desktop** o **Docker Engine** funcionando:
  ```bash
  docker version
  docker info | head -n 20
  ```
- **Puertos libres**: 8081, 8082
- **Editor de texto** (VS Code)

## 📁 4) Insumos y materiales

### Estructura de esta carpeta:
```
02-volumen-persistente-nginx/
├── Dockerfile
├── index.html
└── README.md
```

### Archivos:

#### **Dockerfile**
```dockerfile
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
```

#### **index.html**
```html
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <title>Persistencia con Volúmenes</title>
</head>
<body>
  <h1>Persistencia con volúmenes</h1>
  <p>Este archivo fue empaquetado en la imagen.</p>
</body>
</html>
```

### Opcional (verificación del archivo):
```bash
# macOS/Linux
shasum -a 256 index.html
# Windows PowerShell
Get-FileHash index.html -Algorithm SHA256
```

## 🚀 5) Pasos numerados (CLI)

### **A. Construir la imagen base**

**Dónde**: terminal en tu máquina, dentro de esta carpeta.

```bash
docker build -t penta-nginx:1.0 .
```

### **B. Escenario 1: Bind mount (carpeta del host)**

**Crear una carpeta local para servir contenido:**

```bash
mkdir -p html
echo "<h1>Contenido del host</h1>" > html/index.html
```

**Ejecutar Nginx montando la carpeta:**

**macOS/Linux:**
```bash
docker run -d --name web-bind -p 8081:80 \
  -v "$(pwd)/html:/usr/share/nginx/html" \
  penta-nginx:1.0
```

**Windows PowerShell:**
```powershell
docker run -d --name web-bind -p 8081:80 `
  -v "${PWD}\html:/usr/share/nginx/html" `
  penta-nginx:1.0
```

### **C. Escenario 2: Volumen nombrado (gestionado por Docker)**

**Crear el volumen:**
```bash
docker volume create datos_web
```

**Iniciar un contenedor usando ese volumen:**
```bash
docker run -d --name web-vol -p 8082:80 \
  -v datos_web:/usr/share/nginx/html \
  penta-nginx:1.0
```

**Escribir un archivo dentro del volumen (desde el contenedor):**
```bash
docker exec web-vol sh -c \
  "echo '<h1>Archivo persistente</h1>' > /usr/share/nginx/html/persistente.html"
```

### **D. Probar la persistencia (volumen nombrado)**

**Eliminar el contenedor:**
```bash
docker rm -f web-vol
```

**Levantar otro contenedor con el mismo volumen:**
```bash
docker run -d --name web-vol2 -p 8082:80 \
  -v datos_web:/usr/share/nginx/html \
  penta-nginx:1.0
```

## 📝 6) Explicación de cada paso

- **Build**: se crea una imagen que incluye un `index.html` inicial
- **Bind mount**: el contenido que ve Nginx es el de tu carpeta `html/` del host. Cambios locales se reflejan al refrescar
- **Volumen nombrado**: Docker guarda los archivos en un path administrado. Al recrear el contenedor, los archivos siguen disponibles porque viven en el volumen, no en el contenedor

## ✅ 7) Verificación / Validación

### **Bind mount**
- Abrir http://localhost:8081 → debe verse "Contenido del host"
- Editar `html/index.html` y refrescar el navegador → el cambio aparece sin reconstruir

### **Volumen nombrado**
- Abrir http://localhost:8082/persistente.html → debe verse "Archivo persistente"

**Inspeccionar el volumen:**
```bash
docker volume inspect datos_web
```

**Confirmar que el contenedor nuevo ve el mismo archivo:**
```bash
docker exec web-vol2 ls -l /usr/share/nginx/html
```

## 🚨 8) Problemas comunes y solución

| Síntoma | Causa probable | Solución |
|---------|----------------|----------|
| No se ven cambios del bind mount | Ruta incorrecta o relativa | Usa ruta absoluta (`$(pwd)` en macOS/Linux, `${PWD}` en PowerShell) |
| 403/404 al acceder | Archivo no existe o permisos | Verifica archivo en la ruta montada; revisa `docker exec web-bind ls /usr/share/nginx/html` |
| Puerto ya en uso | Otro proceso escucha en 8081/8082 | Cambia a `-p 8085:80` o libera el puerto |
| En Linux con SELinux | Políticas de SELinux bloquean acceso | Añade `:z` o `:Z` al volumen del bind mount: `-v "$(pwd)/html:/usr/share/nginx/html:Z"` (según distro) |
| "permission denied" al escribir en volumen | Usuario sin permisos | En Alpine/Nginx ocasional; escribe desde `docker exec` como root o ajusta permisos con `chown -R nginx:nginx` |

## 🧹 9) Limpieza

```bash
docker rm -f web-bind web-vol2 2>/dev/null || true
docker volume rm datos_web 2>/dev/null || true
```

**Si quieres limpiar más:**
```bash
docker system prune -f
docker volume prune -f
```

## 💡 10) Consideraciones de costo, seguridad y buenas prácticas

### **💰 Costo**
- En local no hay costo; en nube los volúmenes persistentes cobran por GB/mes
- Evita guardar binarios grandes en el contenedor

### **🔒 Seguridad**
- En producción, monta volúmenes en rutas mínimas y con permisos de usuario no root
- Evita exponer directorios sensibles del host

### **✅ Buenas prácticas**
- **Para desarrollo**: el bind mount acelera el ciclo de edición
- **Para ambientes controlados**: un volumen nombrado evita dependencia del path del host
- **Incluye** `.dockerignore` para reducir contexto de build
- **Documenta** puertos y rutas montadas en un README de la app

## 🖥️ Alternativa GUI (Docker Desktop)

1. **Volumes** → Create → `datos_web`
2. **Containers** → Run `penta-nginx:1.0` → Mount → Attach volumen `datos_web` en `/usr/share/nginx/html`
3. **Exec** → crea `persistente.html` y valida en http://localhost:8082/persistente.html