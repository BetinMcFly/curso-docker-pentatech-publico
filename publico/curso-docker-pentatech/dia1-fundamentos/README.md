
# Día 1 – Fundamentos y primeros contenedores

En este primer día aprendemos qué es un contenedor y cómo funciona Docker con ejemplos muy simples pero poderosos.  

---

## Ejemplos incluidos

### 1. Servidor web Nginx en segundos (`nginx-hello/`)
Levanta un servidor web en el puerto 8080 con un solo comando.  
- **Construcción y ejecución:**
  ```bash
  docker run -d --name web -p 8080:80 nginx:alpine
````

* **Validación:**
  Abre en el navegador 👉 [http://localhost:8080](http://localhost:8080)

---

### 2. Contenedor Alpine interactivo (`alpine-shell/`)

Muestra que un contenedor es un proceso aislado y mínimo (\~5 MB).

* **Ejecución:**

  ```bash
  docker run -it --name mini alpine sh
  ```
* **Validación:**
  Dentro del contenedor:

  ```bash
  cat /etc/os-release
  ```

  Verás que es **Alpine Linux**.

---

### 3. Redis en segundos (`redis-demo/`)

Levanta un servicio de cache y guarda datos en memoria.

* **Ejecución:**

  ```bash
  docker run -d --name cache -p 6379:6379 redis
  docker exec -it cache redis-cli set saludo "Pentatech"
  docker exec -it cache redis-cli get saludo
  ```
* **Validación:**
  El comando debe devolver `Pentatech`.

---

## Objetivos de este día

* Diferenciar entre una **máquina virtual** y un **contenedor**.
* Entender que los contenedores son **rápidos de iniciar y destruir**.
* Conocer los primeros comandos básicos: `docker run`, `docker ps`, `docker exec`, `docker logs`.

````

---




