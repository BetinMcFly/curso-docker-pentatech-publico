
---

# 🧠 Preguntas Frecuentes (FAQ)

### Curso Docker Pentatech — *De cero a la nube (GCP)*

Versión: **1.1** · Autor: *Instructor Técnico*

---

## 📚 Índice rápido

* [⚙️ Fundamentos de Docker](#️-fundamentos-de-docker)
* [🧱 Imágenes y Seguridad](#-imágenes-y-seguridad)
* [🌐 Redes y Conectividad](#-redes-y-conectividad)
* [💾 Persistencia y Almacenamiento](#-persistencia-y-almacenamiento)
* [🚀 Optimización y Buenas Prácticas](#-optimización-y-buenas-prácticas)
* [☁️ Docker en la Nube (GCP)](#️-docker-en-la-nube-gcp)
* [🏢 Casos Empresariales y Operativos](#-casos-empresariales-y-operativos)
* [📚 Recursos Útiles](#-recursos-útiles)
* [💬 ¿Tienes más dudas?](#-tienes-más-dudas)

---

## ⚙️ Fundamentos de Docker

**¿Qué es Docker?**
Docker empaqueta aplicaciones y dependencias en *contenedores portables y consistentes*.
Soluciona el clásico: *“funciona en mi máquina, pero no en la tuya”*.

**¿En qué se diferencia un contenedor de una VM?**

| Aspecto     | Máquina Virtual    | Contenedor           |
| ----------- | ------------------ | -------------------- |
| Kernel      | Propio             | Comparte el del host |
| Tamaño      | GBs                | MBs                  |
| Inicio      | Segundos a minutos | 1–3 segundos         |
| Aislamiento | Completo           | A nivel de proceso   |

**¿Cuánto se ahorra en recursos?**
Un contenedor puede ser **5–10× más eficiente** que una VM:

* CPU overhead: <2 %
* RAM: cientos de MB
* Arranque: segundos

---

## 🧱 Imágenes y Seguridad

**¿Qué tan seguro es Docker Hub?**
Seguro si usas **imágenes oficiales o verificadas** (`library/nginx`, `mysql`, `redis`).
Evita imágenes desconocidas, revisa el `Dockerfile` y ejecuta:

```bash
docker scan <nombre_imagen>
```

o usa [Trivy](https://aquasecurity.github.io/trivy/).

**¿Qué son las imágenes oficiales?**
Mantenidas por Docker Inc. o por el proveedor del software.
Ejemplo: `library/ubuntu`, `library/nginx`.

**¿Puedo tener mis propias imágenes privadas?**
Sí:

* Docker Hub privado
* GitHub Container Registry
* Google Artifact Registry (recomendado para GCP)

---

## 🌐 Redes y Conectividad

**¿Docker maneja VLANs?**
No directamente, pero puede **integrarse** con VLANs del sistema operativo usando `macvlan` o `ipvlan`.

```bash
docker network create -d macvlan \
  --subnet=192.168.10.0/24 \
  --gateway=192.168.10.1 \
  -o parent=eth0.10 vlan10-net
```

**¿Puedo asignar una IP fija a un contenedor?**

```bash
docker network create --subnet=192.168.5.0/24 redlocal
docker run --net redlocal --ip 192.168.5.10 nginx
```

**¿Varios contenedores con una misma IP?**
No directamente, pero puedes usar un **proxy inverso (Nginx, Traefik)** o la red tipo host:

```bash
docker run --network host nginx
```

---

## 💾 Persistencia y Almacenamiento

**¿Pierdo los datos al borrar un contenedor?**
Sí, a menos que uses volúmenes:

```bash
docker run -d -v datos:/var/lib/mysql mysql
```

**¿Diferencias entre volúmenes y bind mounts?**

| Tipo       | Gestionado por Docker | Portabilidad | Recomendado para |
| ---------- | --------------------- | ------------ | ---------------- |
| Volumen    | ✅ Sí                  | Alta         | Producción       |
| Bind mount | ❌ No                  | Baja         | Desarrollo       |

---

## 🚀 Optimización y Buenas Prácticas

**¿Qué es un multi-stage build?**
Permite compilar en una imagen grande y generar una final ligera.
Ejemplo:

```dockerfile
FROM golang:1.21 AS build
WORKDIR /src
COPY . .
RUN go build -o app

FROM alpine:3.19
COPY --from=build /src/app /usr/local/bin/app
CMD ["app"]
```

**¿Por qué usar imágenes ligeras como Alpine o Distroless?**
Reducen el tamaño y la superficie de ataque.

**¿Por qué evitar el usuario root en contenedores?**

```dockerfile
RUN adduser -D appuser
USER appuser
```

👉 Si un atacante explota la app, no obtiene privilegios de administrador.

---

## ☁️ Docker en la Nube (GCP)

**¿Qué es Artifact Registry?**
El repositorio privado de imágenes Docker en Google Cloud, sucesor de GCR.

**¿Diferencia entre Cloud Run y GKE?**

| Característica             | Cloud Run                | GKE                      |
| -------------------------- | ------------------------ | ------------------------ |
| Gestión de infraestructura | Totalmente serverless    | Administrada             |
| Escalado                   | Automático (por request) | Manual o automático      |
| Ideal para                 | Apps web, APIs           | Microservicios complejos |

**¿Docker funciona en otras nubes?**
Sí: AWS (ECS/EKS), Azure (Container Apps/AKS), IBM Cloud, Oracle, etc.
La portabilidad es una de sus mayores ventajas.

---

## 🏢 Casos Empresariales y Operativos

**¿Docker es solo para desarrolladores?**
No. Se usa en QA, seguridad, DevOps, automatización y pruebas integradas.

**¿Cómo reduce costos?**
Más densidad de servicios, menos infraestructura, menos fallos y despliegues más rápidos.

**¿Quién usa Docker en producción?**
Google, Netflix, PayPal, Spotify, MercadoLibre, y prácticamente cualquier empresa moderna.

---

## 📚 Recursos Útiles

* [Documentación oficial de Docker](https://docs.docker.com/)
* [Docker Hub](https://hub.docker.com/)
* [Docker Networking](https://docs.docker.com/network/)
* [Google Cloud Run](https://cloud.google.com/run)
* [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine)

---

## 💬 ¿Tienes más dudas?

Abre un **Issue** en este repositorio con el prefijo:

```
Pregunta: [tu tema]
```

O consúltalo en vivo durante las sesiones del curso.

> *Las preguntas más votadas se incorporarán en futuras versiones de este documento.*

---

# 🏁 Fin del documento

---

## ✅ Integración con tu repositorio

1. Crea el archivo:

   ```
   curso-docker-pentatech/FAQ.md
   ```

2. Pega el contenido anterior.

3. Edita tu `README.md` y añade al final:

   ```md
   ---
   ## ❓ Preguntas Frecuentes
   Consulta las dudas más comunes en el curso:
   👉 [Ver FAQ completo](./FAQ.md)
   ```

4. Haz commit y push:

   ```bash
   git add FAQ.md README.md
   git commit -m "Añadir FAQ visual y profesional para el curso Docker Pentatech"
   git push origin main
   ```

---
