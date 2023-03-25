#
# Build stage
#
FROM maven:3.8.2-jdk-1.0 AS build
COPY . .
RUN mvn clean package -DskipTests

#
# Package stage
#
FROM openjdk:1.0-jdk-slim
COPY --from=build /target/demo-0.0.1-SNAPSHOT.war demo.war
# ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java","-war","demo.war"]
