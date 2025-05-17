# For deploying custom kafka images with Custom Configurations

FROM confluentinc/cp-kafka:latest

# Create directories for data and logs
RUN mkdir -p /var/lib/kafka/data && \
  mkdir -p /var/lib/kafka/logs && \
  chmod -R 777 /var/lib/kafka

# Copy custom configuration file if needed
# COPY custom-kafka-config.properties /etc/kafka/custom-kafka-config.properties

# volume for persisting data
VOLUME ["var/lib/kafka/data", "var/lib/kafka/logs"]

EXPOSE ${KAFKA_PORT} ${KAFKA_EXTERNAL_PORT}

# Note: ENTRYPOINT and CMD are inherited from the base image
# For reference, the base image typically uses:
# ENTRYPOINT ["/etc/confluent/docker/run"]
# No explicit CMD is needed as it's handled by the entrypoint script
# Don't override the ENTRYPOINT/CMD unless you have a specific need