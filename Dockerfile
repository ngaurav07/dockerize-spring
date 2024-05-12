FROM maven:3.9.3-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean install -DskipTests


FROM eclipse-temurin:17-jre AS layers
WORKDIR layer
COPY --from=builder /app/target/kubernetes-0.0.1-SNAPSHOT.jar  app.jar
RUN java -Djarmode=layertools -jar app.jar extract


FROM eclipse-temurin:17-jre
WORKDIR /opt/app
COPY --from=layers /layer/dependencies/ ./
COPY --from=layers /layer/spring-boot-loader/ ./
COPY --from=layers /layer/snapshot-dependencies/ ./
COPY --from=layers /layer/application/ ./
EXPOSE 8080
ENTRYPOINT ["java", "org.springframework.boot.loader.launch.JarLauncher"]


