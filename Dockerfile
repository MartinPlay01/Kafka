####### Instructions ########

FROM ubuntu

RUN apt-get update

RUN apt-get install -y openjdk-8-jdk

RUN apt-get install -y wget \
	&& wget http://apache.rediris.es/kafka/2.4.0/kafka_2.12-2.4.0.tgz \
#	&& mv kafka_2.12-2.4.0.tgz /home \
	&& tar -xzf kafka_2.12-2.4.0.tgz \
	&& rm -R kafka_2.12-2.4.0.tgz


#WORKDIR /home

RUN chmod +x /kafka_2.12-2.4.0

### COPY ###

COPY server-1.properties /kafka_2.12-2.4.0/config/

COPY server-2.properties /kafka_2.12-2.4.0/config/


#ADD runzk-kf.sh .

COPY runzk-kf.sh /usr/local/bin/runzk-kf.sh

#COPY runzk-kf.sh .
RUN chmod +x /usr/local/bin/runzk-kf.sh

EXPOSE 2181

EXPOSE 9092

EXPOSE 9093

EXPOSE 9094

CMD ./bin/bash

#ENTRYPOINT nohup /usr/local/bin/runzk-kf.sh &

#ENTRYPOINT ./runzk-kf.sh

#RUN bash -c "/kafka_2.12-2.4.0/bin/zookeeper-server-start.sh /kafka_2.12-2.4.0/config/zookeeper.properties &"

### RUN KAFKA ###

#### CMD ####

#ENTRYPOINT ["/kafka_2.12-2.4.0/bin/zookeeper-server-start.sh /kafka_2.12-2.4.0/config/zookeeper.properties"]

#CMD ["/home/kafka_2.12-2.4.0/bin/kafka-server-start.sh /home/kafka_2.12-2.4.0/config/server.properties"]
#CMD ["/home/kafka_2.12-2.4.0/bin/kafka-server-start.sh /home/kafka_2.12-2.4.0/config/server-1.properties"]
#CMD ["/home/kafka_2.12-2.4.0/bin/kafka-server-start.sh /home/kafka_2.12-2.4.0/config/server-2.properties"]




#ENTRYPOINT ["/kafka_2.12-2.4.0/bin/zookeeper-server-start.sh /kafka_2.12-2.4.0/config/zookeeper.properties"]

#ENTRYPOINT ["/kafka_2.12-2.4.0/bin/kafka-server-start.sh /kafka_2.12-2.4.0/config/server.properties"]
#ENTRYPOINT ["/kafka_2.12-2.4.0/bin/kafka-server-start.sh /kafka_2.12-2.4.0/config/server-1.properties"]
#ENTRYPOINT ["/kafka_2.12-2.4.0/bin/kafka-server-start.sh /kafka_2.12-2.4.0/config/server-2.properties"]


### ENV ###

#ENV ls-topics="/home/kafka_2.12-2.4.0/bin/kafka-topics.sh --list --bootstrap-server localhost:9092"

#ENV cr-topic="/home/kafka_2.12-2.4.0/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic"

#ENV producer="/home/kafka_2.12-2.4.0/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic"

#ENV consumer="/home/kafka_2.12-2.4.0/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --from-beginning --topic"

#RUN apt-get install -y python

#RUN echo 1.0 >> /etc/version && apt-get install -y git \
#	&& apt-get install -y iputils-ping
#RUN mkdir /datos
#WORKDIR /datos
#RUN touch f1.txt
#WORKDIR /datos1
#RUN touch f2.txt


### COPY ###
#COPY index.html .
#COPY app.log /datos

### ADD ###


### ENV ###
#ENV dir=/data dir1=/data1

#RUN mkdir $dir && mkdir $dir1


### ENTRYPOINT ###
#ENTRYPOINT ["/bin/bash"]
