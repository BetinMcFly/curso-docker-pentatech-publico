# 📦 Volumen persistente con Nginx (Bind Mount)

Este laboratorio demuestra cómo mantener archivos **persistentes** entre contenedores usando un **bind mount**, es decir, una carpeta del host compartida con el contenedor.

El objetivo es entender que **el contenedor es efímero**, pero **los datos pueden vivir fuera de él**.

---

## 🎯 Objetivos

- Comprender la diferencia entre **bind mounts** y **volúmenes Docker**
- Aprender a compartir una carpeta local con el contenedor
- Validar que los cambios en el host se reflejan dentro del contenedor en tiempo real

---

## 🧠 Fundamento teórico

| Tipo de almacenamiento | Administrado por | Persistencia | Caso de uso |
|-------------------------|------------------|---------------|--------------|
| **Bind mount** | El usuario (carpeta del host) | Mientras exista la carpeta local | Desarrollo local, pruebas rápidas |
| **Docker volume** | Docker Engine | Persiste hasta que se elimina explícitamente | Producción, bases de datos |

> **💡 Concepto clave:** Un bind mount **monta una carpeta local directamente dentro del contenedor**.  
> Los archivos del host son accesibles y modificables desde el contenedor, sin reconstruir la imagen.

---

## 📁 Estructura del ejemplo

```
01-volumen-bindmount-nginx/
├── Dockerfile
├── index.html
└── README.md
```

---

## 🧰 Archivos principales

### **Dockerfile**
```dockerfile
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
```

### **index.html**
```html
<h1>Docker Bind Mount</h1>
<p>Este contenido proviene de la imagen base.</p>
```

---

## ⚙️ Pasos del laboratorio

### **A. Construir la imagen base**

**Dónde:** terminal, dentro de esta carpeta.

```bash
docker build -t penta-nginx:1.0 .
```

**Verifica:**
```bash
docker images | grep penta-nginx
```

**Deberías ver:**
```
penta-nginx   1.0   <IMAGE_ID>   <date>   15MB
```

### **B. Crear carpeta local para el contenido**

```bash
mkdir -p html
echo "<h1>Contenido del host</h1>" > html/index.html
```

> Esta carpeta `html` será el directorio compartido entre el host y el contenedor.

### **C. Ejecutar el contenedor con bind mount**

**macOS / Linux:**
```bash
docker run -d --name web-bind -p 8081:80 \
  -v "$(pwd)/html:/usr/share/nginx/html" \
  penta-nginx:1.0
```

**Windows PowerShell:**
```powershell
docker run -d --name web-bind -p 8081:80 `
  -v ${PWD}\html:/usr/share/nginx/html `
  penta-nginx:1.0
```

### **D. Validar**

**Abre en tu navegador:**
👉 http://localhost:8081

**Deberías ver:**
```
Contenido del host
```

### **E. Modificar contenido sin reiniciar**

**Edita el archivo del host:**
```bash
echo "<h2>Actualizado en vivo desde el host</h2>" > html/index.html
```

**Actualiza el navegador y verás el cambio al instante.**

> Esto demuestra que el contenedor lee directamente del host, sin necesidad de reconstruir la imagen.

### **F. Validar dentro del contenedor**

```bash
docker exec web-bind cat /usr/share/nginx/html/index.html
```

**Salida esperada:**
```html
<h2>Actualizado en vivo desde el host</h2>
```

> **💡 Concepto clave:** "El contenedor ve los mismos archivos que existen en mi máquina local."

### **G. Destruir y volver a crear**

**1️⃣ Eliminar el contenedor actual:**
```bash
docker rm -f web-bind
```

**2️⃣ Crear uno nuevo con el mismo bind mount:**
```bash
docker run -d --name web-bind2 -p 8082:80 \
  -v "$(pwd)/html:/usr/share/nginx/html" \
  penta-nginx:1.0
```

**3️⃣ Validar:**
👉 http://localhost:8082

**El contenido sigue intacto ✅**

> **💡 Concepto clave:** "Aunque destruí el contenedor, los archivos permanecieron. Eso es persistencia mediante bind mount."

### **H. Limpieza**

```bash
docker rm -f web-bind2
rm -rf html
```

---

## ⚡ Problemas comunes

| Error | Causa probable | Solución |
|-------|----------------|----------|
| **403 Forbidden** | Permisos de la carpeta local | `chmod -R 755 html` (Linux/macOS) |
| **File not found** | Ruta mal definida en `-v` | Usa `$(pwd)` o `${PWD}` según el shell |
| **Puerto ocupado** | Otro contenedor sigue activo | `docker ps`, luego `docker rm -f <id>` |

---

## 🎓 Conceptos clave aprendidos

- ✅ **Bind mounts** permiten compartir carpetas del host con el contenedor
- ✅ Los cambios en el host se reflejan **inmediatamente** en el contenedor
- ✅ Los datos persisten aunque el contenedor se destruya
- ✅ Ideal para **desarrollo local** y **pruebas rápidas**