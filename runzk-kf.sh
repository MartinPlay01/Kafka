#!/bin/sh
# turn on bash's job control

set -m

### RUN Zookeper

./kafka_2.12-2.4.0/bin/zookeeper-server-start.sh /kafka_2.12-2.4.0/config/zookeeper.properties &

### RUN Kafka brokers ###

./kafka_2.12-2.4.0/bin/kafka-server-start.sh /kafka_2.12-2.4.0/config/server.properties &

./kafka_2.12-2.4.0/bin/kafka-server-start.sh /kafka_2.12-2.4.0/config/server-1.properties &

./kafka_2.12-2.4.0/bin/kafka-server-start.sh /kafka_2.12-2.4.0/config/server-2.properties &
