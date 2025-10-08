#!/bin/bash

echo "🔍 Monitor de la aplicación Docker"
echo "=================================="
echo ""

while true; do
    clear
    echo "🔍 Monitor de la aplicación Docker - $(date)"
    echo "=============================================="
    echo ""
    
    echo "📊 Estado de los contenedores:"
    docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
    echo ""
    
    echo "🌐 Test de conectividad:"
    echo "Frontend (puerto 8080):"
    if curl -s http://localhost:8080 > /dev/null; then
        echo "  ✅ Frontend accesible"
    else
        echo "  ❌ Frontend no accesible"
    fi
    
    echo ""
    echo "🔗 Comunicación interna (backend → frontend):"
    if docker exec frontend wget -qO- http://backend:5000 > /dev/null 2>&1; then
        echo "  ✅ Comunicación interna funciona"
        echo "  📝 Respuesta: $(docker exec frontend wget -qO- http://backend:5000)"
    else
        echo "  ❌ Comunicación interna falla"
    fi
    
    echo ""
    echo "📋 Logs recientes del backend:"
    docker logs --tail 3 backend 2>/dev/null || echo "  No hay logs disponibles"
    
    echo ""
    echo "⏰ Actualizando en 5 segundos... (Ctrl+C para salir)"
    sleep 5
done

