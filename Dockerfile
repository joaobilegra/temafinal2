
FROM ubuntu:latest

RUN apt-get update \
    && apt install openjdk-11-jdk -y
RUN apt-get install  curl -y
WORKDIR /app
COPY . .
WORKDIR /app/app/aggregation-service/
RUN ./gradlew clean build bootJar 
EXPOSE 8080
ENTRYPOINT exec java -jar build/libs/aggregation-service-0.0.1-SNAPSHOT.jar
