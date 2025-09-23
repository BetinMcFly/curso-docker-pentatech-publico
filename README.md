# 🐳 Curso Docker Pentatech: De cero a la nube (GCP)

Este repositorio contiene los **ejemplos, código y materiales** del curso **Docker Básico a Intermedio** impartido en el evento **Pentatech**.  
El objetivo es que cualquier participante pueda **explorar los ejemplos**, revisar los **Dockerfiles** y entender cómo usar contenedores desde lo más básico hasta un despliegue en la nube con **Google Cloud Run**.

---

## 📅 Agenda del curso

- **Día 1:** Fundamentos y primeros contenedores  
- **Día 2:** Creación de imágenes y Dockerfiles  
- **Día 3:** Volúmenes, redes y Docker Compose  
- **Día 4:** Optimización y seguridad en contenedores  
- **Día 5:** Docker en la nube con GCP (Cloud Run)  

---

##  Requisitos

No es obligatorio instalar Docker en tu computadora de trabajo (las demos se muestran en vivo).  
Si deseas practicar en tu equipo personal:  
- Instala [Docker Desktop](https://docs.docker.com/get-docker/) o Docker Engine.  
- (Opcional) Instala el [Google Cloud CLI](https://cloud.google.com/sdk/docs/install) para probar los ejemplos de despliegue en GCP.  

---

##  Estructura del repositorio

```

curso-docker-pentatech/
├── dia1-fundamentos/              # Contenedores básicos
├── dia2-imagenes/                 # Creación de imágenes
├── dia3-volumenes-redes-compose/  # Volúmenes y orquestación con Compose
├── dia4-optimizacion-seguridad/   # Buenas prácticas y seguridad
├── dia5-gcp/                      # Docker en la nube (Cloud Run)
├── slides/                        # Presentación en PDF
└── cheatsheet-docker.pdf          # Resumen de comandos

```

Cada carpeta incluye:
- **Código de ejemplo** (`Dockerfile`, `index.html`, `app.py`, `docker-compose.yml`).  
- **README.md local** con explicación del ejemplo, pasos de ejecución y validación.  

---

##  Ejemplos destacados

- **Día 1:** Servidor Nginx en segundos, Redis como cache.  
- **Día 2:** Página HTML corporativa, API en Flask, Linktree personalizado.  
- **Día 3:** WordPress + MySQL con Docker Compose, Adminer conectado a MySQL.  
- **Día 4:** Imágenes ligeras con `slim`, multistage build con FastAPI, usuario no root.  
- **Día 5:** Publicación en Google Container Registry (GCR) y despliegue en Cloud Run.  

---

##  Material de apoyo

- [Slides del curso (PDF)](./slides/Curso-Docker.pdf)  
- [Cheat sheet de comandos Docker](./cheatsheet-docker.pdf)  

---

##  Recursos recomendados

- [Documentación oficial de Docker](https://docs.docker.com/)  
- [Docker Hub](https://hub.docker.com/)  
- [Google Cloud Run](https://cloud.google.com/run)  

---

##  Licencia

MIT — libre para aprender, usar y compartir   
```



