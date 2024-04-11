#!/bin/bash

# Te paras en esta carpeta charts y le das ./microservices.sh 

# Directorio donde se encuentran los charts
CHARTS_DIR="/mnt/d/luism/OneDrive/Escritorio/Noveno Semestre/Sistemas Distribuidos/microservices_with_helm/charts"

# Lanzar el despliegue de cada chart
helm install auth-api "$CHARTS_DIR/auth-api"
helm install log-message "$CHARTS_DIR/log-message"
helm install frontend "$CHARTS_DIR/frontend"
helm install todos-api "$CHARTS_DIR/todos-api"
helm install users-api "$CHARTS_DIR/users-api"
helm install redis-queue "$CHARTS_DIR/redis-queue"
helm install zipkin "$CHARTS_DIR/zipkin"
# Agrega más comandos helm install según sea necesario para tus otros charts

echo "Despliegue de todos los charts completado"

# Comando para eliminar todo de un solo 

# helm ls --short | xargs -L1 helm uninstall 