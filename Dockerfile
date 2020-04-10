####### Instructions ########

FROM ubuntu

RUN apt-get update

RUN apt-get install -y openjdk-8-jdk

RUN apt-get install -y wget \
        && wget http://apache.rediris.es/kafka/2.4.0/kafka_2.12-2.4.0.tgz \
        && tar -xzf kafka_2.12-2.4.0.tgz \
        && rm -R kafka_2.12-2.4.0.tgz

RUN chmod +x /kafka_2.12-2.4.0

### COPY ###

COPY server-1.properties /kafka_2.12-2.4.0/config/

COPY server-2.properties /kafka_2.12-2.4.0/config/

COPY runzk-kf.sh /usr/local/bin/runzk-kf.sh

RUN chmod +x /usr/local/bin/runzk-kf.sh

CMD ["runzk-kf.sh"]

EXPOSE 2181

EXPOSE 9092

EXPOSE 9093

EXPOSE 9094

