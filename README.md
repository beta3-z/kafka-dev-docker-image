# NOTES

bin/kafka-topics.sh --zookeeper localhost:2181 \
    --create --topic helloworld --partitions 1 --replication-factor 1

bin/kafka-topics.sh --zookeeper localhost:2181 --list

bin/kafka-topics.sh --describe --zookeeper localhost:2181 --topic helloworld

bin/kafka-console-producer.sh --broker-list localhost:9092 --topic helloworld

bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic helloworld --from-beginning


