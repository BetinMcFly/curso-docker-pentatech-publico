#!/bin/bash

echo "🚀 Iniciando desarrollo con visualización en Cursor..."

# Verificar que Docker esté corriendo
if ! docker ps > /dev/null 2>&1; then
    echo "❌ Docker no está corriendo. Iniciando contenedores..."
    docker-compose up -d
else
    echo "✅ Docker ya está corriendo"
fi

# Esperar a que los servicios estén listos
echo "⏳ Esperando a que los servicios estén listos..."
sleep 3

# Verificar que el frontend esté accesible
if curl -s http://localhost:8080 > /dev/null; then
    echo "✅ Frontend accesible en http://localhost:8080"
    echo "🌐 Abriendo en Cursor..."
    
    # Abrir en Cursor (esto abrirá el navegador integrado)
    open http://localhost:8080
else
    echo "❌ Frontend no está accesible"
    echo "🔧 Intentando levantar los servicios..."
    docker-compose up -d
fi

echo "📝 Para usar Live Preview:"
echo "   1. Abre frontend/index.html en Cursor"
echo "   2. Clic derecho → 'Open with Live Server'"
echo "   3. O usa Ctrl+Shift+V"
