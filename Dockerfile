FROM gradle:7.5.1-jdk17-alpine AS build
COPY . .
RUN ./gradlew build --no-daemon

FROM eclipse-temurin:17-jdk-alpine
COPY --from=build /home/gradle/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]
