# Usa una imagen base con soporte para Java 21
FROM eclipse-temurin:21-jdk-alpine

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /home/user/.local/tmp/buildkit-mount926909913/

# Copia el archivo JAR de tu aplicación al contenedor
# Asegúrate de que el nombre coincida con el generado por Gradle
COPY ./build/libs/it-services-0.0.1-SNAPSHOT.jar app.jar

# Expone el puerto configurado en tu aplicación (1020)
EXPOSE 1020

# Configura variables de entorno para MongoDB (opcional)
ENV SPRING_DATA_MONGODB_URI=mongodb+srv://heribertoem19:-6PS234n2nTeLcH@mycluster.ei0r1.mongodb.net/?retryWrites=true&w=majority&appName=MyCluster
ENV SPRING_DATA_MONGODB_DATABASE=sample_mflix

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
