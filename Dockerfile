# Etapa 1: Construcción
FROM maven:3.9-eclipse-temurin-23 AS build
WORKDIR /app
# Copiamos el pom y el código fuente
COPY pom.xml .
COPY src ./src
# Compilamos de verdad dentro de Docker
RUN mvn clean package -DskipTests

# Etapa 2: Ejecución
FROM eclipse-temurin:23-jre
WORKDIR /app
# Copiamos el JAR generado en la etapa anterior
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
