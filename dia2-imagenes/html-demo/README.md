# Ejemplo: Landing HTML personalizada

Este ejemplo muestra cómo empaquetar un `index.html` dentro de un contenedor Nginx para crear una página corporativa simple.

---

## Archivos

- `index.html` → página de bienvenida personalizada.  
- `Dockerfile` → receta de construcción de la imagen.

---

## Contenido de `Dockerfile`

```dockerfile
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html

### Día 2 - Imágenes Personalizadas

# Construir imagen HTML
cd dia2-imagenes/html-demo
docker build -t mi-pagina .
docker run -d --name web -p 8080:80 mi-pagina



