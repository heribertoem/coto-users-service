FROM ubuntu:latest AS build
RUN apt-get update
RUN apt-get install openjdk-21-jdk -y
COPY . .
RUN ./gradlew bootJar --no-daemon

FROM openjdk:21-jdk-slim
EXPOSE 1020
COPY --from=buil /build/libs/it-services-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]