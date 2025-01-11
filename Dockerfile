FROM eclipse-temurin:21-jdk-alpine as builder

# Instala Gradle manualmente
RUN apk add --no-cache --virtual .build-deps \
    curl bash && \
    curl -s https://services.gradle.org/distributions/gradle-8.0-bin.zip -o gradle.zip && \
    unzip gradle.zip && \
    mv gradle-8.0 /opt/gradle && \
    ln -s /opt/gradle/bin/gradle /usr/bin/gradle && \
    rm gradle.zip && \
    apk del .build-deps

WORKDIR /app

# Copia todo el código fuente y gradle al contenedor
COPY . .

# Ejecuta la construcción del proyecto
RUN gradle build

FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

# Copia el archivo JAR generado por Gradle desde la etapa de construcción
COPY --from=builder /app/build/libs/it-services-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 1020

# Configura variables de entorno para MongoDB
ENV SPRING_DATA_MONGODB_URI=mongodb+srv://heribertoem19:-6PS234n2nTeLcH@mycluster.ei0r1.mongodb.net/?retryWrites=true&w=majority&appName=MyCluster
ENV SPRING_DATA_MONGODB_DATABASE=sample_mflix

ENTRYPOINT ["java", "-jar", "app.jar"]
