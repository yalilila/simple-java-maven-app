FROM maven:3.9.4-eclipse-temurin-17 AS builder
WORKDIR /app 
COPY . .
RUN mvn -B package

FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=builder /app/target/*jar app.jar
ENTRYPOINT [ "java", "-jar", "app.jar" ]