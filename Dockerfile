
FROM gradle:8.12.0-jdk17 AS builder
WORKDIR /home/gradle/src
COPY --chown=gradle:gradle . /home/gradle/src
RUN gradle clean build
    

FROM eclipse-temurin:17
WORKDIR /app
COPY --from=builder /home/gradle/src/build/libs/demo-0.0.1-SNAPSHOT.jar helloworld.jar
EXPOSE 8081
CMD ["java", "-jar", "/app/helloworld.jar"]
