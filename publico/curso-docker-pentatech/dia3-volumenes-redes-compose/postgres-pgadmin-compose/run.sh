#!/bin/bash

# 🐘 PostgreSQL + pgAdmin con Docker Compose
# Script para ejecutar el ejemplo de PostgreSQL con pgAdmin

echo "🚀 Iniciando PostgreSQL + pgAdmin con Docker Compose..."

# Verificar que Docker esté funcionando
if ! docker info > /dev/null 2>&1; then
    echo "❌ Error: Docker no está funcionando. Por favor, inicia Docker Desktop."
    exit 1
fi

# Verificar que docker-compose esté disponible
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Error: docker-compose no está instalado."
    exit 1
fi

# Detener contenedores existentes si los hay
echo "🧹 Limpiando contenedores existentes..."
docker-compose down -v 2>/dev/null

# Construir y ejecutar los servicios
echo "🔨 Construyendo y ejecutando servicios..."
docker-compose up -d

# Esperar a que los servicios estén listos
echo "⏳ Esperando a que los servicios estén listos..."
sleep 10

# Verificar el estado de los contenedores
echo "📊 Estado de los contenedores:"
docker-compose ps

# Mostrar información de acceso
echo ""
echo "✅ Servicios iniciados correctamente!"
echo ""
echo "📋 Información de acceso:"
echo "  🐘 PostgreSQL:"
echo "    - Host: localhost"
echo "    - Puerto: 5432"
echo "    - Usuario: postgres"
echo "    - Contraseña: postgres123"
echo "    - Base de datos: postgres"
echo ""
echo "  🌐 pgAdmin:"
echo "    - URL: http://localhost:8080"
echo "    - Email: admin@pentatech.com"
echo "    - Contraseña: admin123"
echo ""
echo "🔧 Comandos útiles:"
echo "  - Ver logs: docker-compose logs"
echo "  - Detener: docker-compose down"
echo "  - Detener y limpiar: docker-compose down -v"
echo ""
echo "🎉 ¡Listo! Puedes acceder a pgAdmin en http://localhost:8080"
