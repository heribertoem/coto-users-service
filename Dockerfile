# Etapa de construcción con Gradle
FROM gradle:8.0-jdk21 as builder

# Establece el directorio de trabajo dentro del contenedor de construcción
WORKDIR /app

# Copia todos los archivos del proyecto al contenedor
COPY . .

# Ejecuta el proceso de construcción del proyecto para generar el archivo JAR
RUN gradle clean build

# Etapa final
FROM eclipse-temurin:21-jdk-alpine

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo JAR generado desde la etapa de construcción
COPY --from=builder /app/build/libs/it-services-0.0.1-SNAPSHOT.jar app.jar

# Expone el puerto configurado en tu aplicación (1020)
EXPOSE 1020

# Configura variables de entorno para MongoDB (opcional)
ENV SPRING_DATA_MONGODB_URI=mongodb+srv://heribertoem19:-6PS234n2nTeLcH@mycluster.ei0r1.mongodb.net/?retryWrites=true&w=majority&appName=MyCluster
ENV SPRING_DATA_MONGODB_DATABASE=sample_mflix

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
