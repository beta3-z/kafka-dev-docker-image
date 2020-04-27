FROM zookeeper

RUN mkdir /kafka \
	&& cd /kafka \
	&& wget http://mirror.linux-ia64.org/apache/kafka/2.5.0/kafka_2.12-2.5.0.tgz \
	&& tar -xzf kafka_2.12-2.5.0.tgz --strip-components 1 \
	&& rm kafka_2.12-2.5.0.tgz

RUN cd /kafka \
	&& sed -e 's/#listeners=PLAINTEXT:\/\/:9092/listeners=PLAINTEXT:\/\/localhost:9092/g' ./config/server.properties > ./server.properties \
	&& echo "./bin/zookeeper-server-start.sh -daemon ./config/zookeeper.properties" > start.sh \
	&& echo "./bin/kafka-server-start.sh ./config/server.properties" >> start.sh \
	&& chmod +x ./start.sh \
	&& chmod -R 774 /kafka \
	&& chown -R zookeeper /kafka

USER zookeeper
WORKDIR /kafka

EXPOSE 9092

CMD ["./start.sh"]