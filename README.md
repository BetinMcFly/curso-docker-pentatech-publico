# 🐳 Curso Docker Pentatech: De cero a la nube (GCP)

Este repositorio contiene los **ejemplos, código y materiales** del curso **Docker Básico a Intermedio** impartido en el evento **Pentatech**.  
El objetivo es que cualquier participante pueda **explorar los ejemplos**, revisar los **Dockerfiles** y entender cómo usar contenedores desde lo más básico hasta un despliegue en la nube con **Google Cloud Run y GKE**.

---

## 📅 Agenda del curso

- **[Día 1: Fundamentos y primeros contenedores](./dia1-fundamentos/)**  
- **[Día 2: Creación de imágenes y Dockerfiles](./dia2-imagenes/)**  
- **[Día 3: Volúmenes, redes y Docker Compose](./dia3-volumenes-redes-compose/)**  
- **[Día 4: Optimización y seguridad en contenedores](./dia4-optimizacion-seguridad/)**  
- **[Día 5: Docker en la nube con GCP (Cloud Run y GKE)](./dia5-gcp/)**  

---

## ⚙️ Requisitos

No es obligatorio instalar Docker en tu computadora de trabajo (las demos se muestran en vivo).  
Si deseas practicar en tu equipo personal:
- Instala [Docker Desktop](https://docs.docker.com/get-docker/) o Docker Engine.
- (Opcional) Instala el [Google Cloud CLI](https://cloud.google.com/sdk/docs/install) para los ejemplos en GCP.

---

## 📂 Estructura del repositorio

```
curso-docker-pentatech/
├── dia1-fundamentos/                    # Contenedores básicos
│   └── README.md
├── dia2-imagenes/                       # Creación de imágenes
│   ├── html-demo/
│   │   ├── Dockerfile
│   │   ├── index.html
│   │   └── README.md
│   └── README.md
├── dia3-volumenes-redes-compose/        # Volúmenes y orquestación con Compose
│   ├── 01-volumen-persistente-nginx/
│   ├── 02-mysql-adminer-red/
│   ├── 03-postgres-pgadmin-compose/
│   └── README.md
├── dia4-optimizacion-seguridad/         # Buenas prácticas y seguridad
│   ├── 01-multi-stage-build/
│   ├── 02-distroless-node/
│   ├── 03-user-noroot/
│   └── README.md
├── dia5-gcp/                           # Docker en la nube (Cloud Run y GKE)
└── README.md                           # Este archivo
```

**Cada carpeta incluye:**
- **Código de ejemplo** (`Dockerfile`, `index.html`, `app.py`, `docker-compose.yml`, etc.).
- **README.md local** con explicación del ejemplo, pasos de ejecución y validación.

---

## 🚀 Ejemplos destacados

- **Día 1:** Servidor Nginx en segundos, Redis como cache, contenedor Alpine.  
- **Día 2:** Página HTML corporativa, API mínima en Flask, Linktree personalizado.  
- **Día 3:** Persistencia con volúmenes, MySQL+Adminer en red Docker, Postgres+pgAdmin con Compose.  
- **Día 4:** Multi-stage builds, imágenes Distroless, ejecución con usuario no root.  
- **Día 5:** Publicación en Artifact Registry y despliegue en Cloud Run y GKE.  

---

## 📑 Material de apoyo

- [Slides del curso (PDF)](./slides/Curso-Docker.pdf)  
- [Cheat sheet de comandos Docker](./cheatsheet-docker.pdf)

---

## 📚 Recursos recomendados

- [Documentación oficial de Docker](https://docs.docker.com/)  
- [Docker Hub](https://hub.docker.com/)  
- [Google Cloud Run](https://cloud.google.com/run)  
- [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine)

---

## 📜 Licencia

MIT — libre para aprender, usar y compartir.