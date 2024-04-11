#!/bin/bash

# Directorio donde se encuentran los charts
CHARTS_DIR="/ruta/a/tus/charts"

# Lanzar el despliegue de cada chart
helm install auth-api "$CHARTS_DIR/auth-api"
helm install log-message "$CHARTS_DIR/log-message"
helm install frontend "$CHARTS_DIR/frontend"
# Agrega más comandos helm install según sea necesario para tus otros charts

echo "Despliegue de todos los charts completado"