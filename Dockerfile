FROM eclipse-temurin:21-jdk-alpine as builder

# Actualiza los repositorios y añade las herramientas necesarias
RUN apk update && apk add --no-cache bash curl unzip

# Descarga e instala Gradle
ENV GRADLE_VERSION=8.0
RUN curl -sL https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle.zip && \
    unzip gradle.zip && \
    mv gradle-${GRADLE_VERSION} /opt/gradle && \
    ln -s /opt/gradle/bin/gradle /usr/bin/gradle && \
    rm gradle.zip

WORKDIR /app

# Copia el proyecto al contenedor
COPY . .

# Construye el proyecto
RUN gradle clean build

FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

# Copia el archivo JAR generado desde la etapa anterior
COPY --from=builder /app/build/libs/it-services-0.0.1-SNAPSHOT.jar app.jar

# Expone el puerto configurado
EXPOSE 1020

# Configura variables de entorno para MongoDB
ENV SPRING_DATA_MONGODB_URI=mongodb+srv://heribertoem19:-6PS234n2nTeLcH@mycluster.ei0r1.mongodb.net/?retryWrites=true&w=majority&appName=MyCluster
ENV SPRING_DATA_MONGODB_DATABASE=sample_mflix

# Ejecuta la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
