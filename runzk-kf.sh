#!/bin/sh
# turn on bash's job control
sleep 5

set -m

### RUN Zookeper

./kafka_2.12-2.4.0/bin/zookeeper-server-start.sh /kafka_2.12-2.4.0/config/zookeeper.properties &
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_zookeeper: $status"
  exit $status
fi


### RUN Kafka brokers ###

./kafka_2.12-2.4.0/bin/kafka-server-start.sh /kafka_2.12-2.4.0/config/server.properties &
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_first_broker: $status"
  exit $status
fi



./kafka_2.12-2.4.0/bin/kafka-server-start.sh /kafka_2.12-2.4.0/config/server-1.properties &
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_second_broker: $status"
  exit $status
fi

./kafka_2.12-2.4.0/bin/kafka-server-start.sh /kafka_2.12-2.4.0/config/server-2.properties
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_third_broker: $status"
  exit $status
fi

#Black        0;30     Dark Gray     1;30
#Red          0;31     Light Red     1;31
#Green        0;32     Light Green   1;32
#Brown/Orange 0;33     Yellow        1;33
#Blue         0;34     Light Blue    1;34
#Purple       0;35     Light Purple  1;35
#Cyan         0;36     Light Cyan    1;36
#Light Gray   0;37     White         1;37


CYAN='\033[1;36m'
NC='\033[0m'

echo -e "${CYAN} Todos los brokers corriendo...  ${NC} Don't worry champion ${reset}"
