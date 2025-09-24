# 02 – Red Docker con MySQL + Adminer

## 1) Objetivo
Conectar dos contenedores por **red** y que se resuelvan por **nombre** (db ↔ adminer).

## 2) Fundamento teórico
- Una **red Docker** aísla y permite que los contenedores se comuniquen por DNS interno.
- Los contenedores pueden referirse entre sí por **nombre de contenedor**.

## 3) Requisitos previos
- Docker activo.
- Puerto 8083 libre (para Adminer).

## 4) Insumos y materiales
- Script: `run.sh` (crea red, DB y Adminer).

## 5) Pasos numerados
1. Crear red: `docker network create pentanet`
2. Levantar MySQL:
   ```bash
   docker run -d --name db --network pentanet \
     -e MYSQL_ROOT_PASSWORD=pass mysql:5.7
   ```
3. Esperar a que MySQL esté listo (el script hace ping con `mysqladmin`).
4. Levantar Adminer:
   ```bash
   docker run -d --name adminer --network pentanet \
     -p 8083:8080 adminer
   ```

## 6) Explicación
- La red `pentanet` permite que `adminer` resuelva `db` como nombre DNS.
- Adminer es una UI web para conectarse a MySQL.

## 7) Validación
- Abrir: http://localhost:8083  
- Conectar con:
  - **Servidor:** `db`
  - **Usuario:** `root`
  - **Contraseña:** `pass`

Debe abrirse el panel de Adminer y permitir conexión a MySQL.

## 8) Problemas comunes
- **Adminer no conecta:** MySQL no está listo. Espera y reintenta (el script ya espera).
- **Host incorrecto:** usar `db` (nombre del contenedor), no `localhost`.
- **Puerto ocupado:** cambia a `-p 8085:8080`.

## 9) Limpieza
```bash
docker rm -f adminer db
docker network rm pentanet
```

## 10) Buenas prácticas
- Usa redes **por proyecto** para aislar servicios.
- No expongas puertos de bases de datos a internet sin controles.
