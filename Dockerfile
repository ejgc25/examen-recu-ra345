# ====== Etapa 1: Fase de construcción (es temporal)======
# Usamos una imagen de Maven con JDK 23 para construir la aplicación
FROM maven:3.9-eclipse-temurin-23 AS imagen_construccion

FROM eclipse-temurin:23-jdk

WORKDIR /app

COPY target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
