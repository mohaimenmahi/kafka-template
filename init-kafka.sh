#!/bin/bash
echo "Waiting for Kafka to connect..."
cub kafka-ready -b kafka:${KAFKA_PORT} 1 30

echo "Creating Kafka Topics..."
kafka-topics --create --if-not-exists --bootstrap-server kafka:${KAFKA_PORT} --topic user-events --partitions 3 --replication-factor 1
kafka-topics --create --if-not-exists --bootstrap-server kafka:${KAFKA_PORT} --topic order-events --partitions 3 --replication-factor 1

echo "Listuing Kafka Topics..."
kafka-topics --list --bootstrap-server kafka:${KAFKA_PORT}

echo "Kafka Topics created successfully"