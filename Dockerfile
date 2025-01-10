# Etapa 1: Construcción del JAR
FROM gradle:8.0-jdk21 AS builder

# Establece el directorio de trabajo dentro de la etapa de construcción
WORKDIR /app

# Copia los archivos del proyecto al contenedor
COPY . .

# Ejecuta el comando de Gradle para construir el JAR
RUN gradle clean build --no-daemon

# Etapa 2: Ejecución de la aplicación
FROM eclipse-temurin:21-jdk-alpine

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el JAR generado en la etapa de construcción al contenedor
COPY --from=builder /app/build/libs/*.jar app.jar

# Expone el puerto configurado en tu aplicación (1020)
EXPOSE 1020

# Configura variables de entorno para MongoDB (opcional)
ENV SPRING_DATA_MONGODB_URI=mongodb+srv://heribertoem19:-6PS234n2nTeLcH@mycluster.ei0r1.mongodb.net/?retryWrites=true&w=majority&appName=MyCluster
ENV SPRING_DATA_MONGODB_DATABASE=sample_mflix

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
