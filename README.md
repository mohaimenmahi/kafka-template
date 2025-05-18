# Kafka Template

## Manage container with make commands

```bash
# for starting the container
make run

# for stopping the container
make stop

# for entering the running container
make enter
```

# Handling Kafka using bash scripts:

## Creating topics to kafka:

```bash
# First enter to the container
make enter

# list down the topics
kafka-topics.sh --bootstrap-server kafka:9092 --list
## --bootstrap-server is used to determine which broker will be connect, here this is kafka:9092

# create topic inside kafka broker
kafka-topic.sh --bootstrap-server kafka:9092 --create --topic <topic_name> [other options...]
## other options can be: --partitions <number_of_partitions>, --replication-factor <number_of_replicas> etc..
```

## Sending messages via Producer:

```bash
kafka-console-producer.sh --broker-list kafka:9092 --topic <topic_name>
## after hitting the enter, it gives us a new line to write the message
> #write message here and hit enter
```

## Read The messages via Consumer

```bash
# For getting the message real time
kafka-console-consumer.sh --bootstrap-server kafka:9092 --topic <topic_name>
## this will not load the previously sent messages while the consumer was not active, this command will
## only show the messages which are sent just after the consumer is active

# for getting all of the messages of a topic
kafka-console-consumer.sh --bootstrap-server kafka:9092 --topic <topic_name> --from-beginning
##this will show all the old messages along with the new incoming ones
```
