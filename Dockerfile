####### Instructions ########

FROM ubuntu

RUN apt-get update

RUN apt-get install -y openjdk-8-jdk

RUN apt-get install -y wget \
        && wget https://archive.apache.org/dist/kafka/0.11.0.1/kafka_2.11-0.11.0.1.tgz \
        && tar -xzf kafka_2.11-0.11.0.1.tgz \
        && rm -R kafka_2.11-0.11.0.1.tgz

RUN chmod +x kafka_2.11-0.11.0.1 

### COPY ###

COPY server-1.properties /kafka_2.11-0.11.0.1/config/

COPY server-2.properties /kafka_2.11-0.11.0.1/config/

COPY runzk-kf.sh /usr/local/bin/runzk-kf.sh

RUN chmod +x /usr/local/bin/runzk-kf.sh

CMD ["runzk-kf.sh"]

EXPOSE 2181

EXPOSE 9092

EXPOSE 9093

EXPOSE 9094

