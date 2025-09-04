#!/bin/bash

# Script para configurar Kafka después de levantar los contenedores

echo "🚀 Configurando Kafka..."

# Esperar a que Kafka esté listo
#echo "⏳ Esperando a que Kafka esté listo..."
#sleep 2

# Crear el tópico para eventos de materias
echo "📝 Creando tópico 'materia-events'..."
docker exec kafka kafka-topics --create \
  --topic materia-events \
  --bootstrap-server localhost:9092 \
  --replication-factor 1 \
  --partitions 3

# Crear el tópico para eventos de dead letter (opcional, para manejo de errores)
echo "💀 Creando tópico 'dead-letter-queue'..."
docker exec kafka kafka-topics --create \
  --topic dead-letter-queue \
  --bootstrap-server localhost:9092 \
  --replication-factor 1 \
  --partitions 1

# Listar los tópicos creados
echo "📋 Tópicos creados:"
docker exec kafka kafka-topics --list --bootstrap-server localhost:9092

echo "✅ Kafka configurado correctamente!"
echo "🔗 Kafka UI disponible en: http://localhost:8080"
echo "🔗 Kafka broker: localhost:9092"
