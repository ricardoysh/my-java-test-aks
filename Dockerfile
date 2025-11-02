# Stage 1: Build the application
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code
COPY src ./src

# Package the application into a fat JAR using the shade plugin
RUN mvn clean package -DskipTests

# Stage 2: Create the final, smaller runtime image
FROM eclipse-temurin:17-jre-alpine

# Set the working directory
WORKDIR /app

# Copy the fat JAR from the build stage
COPY --from=build /app/target/java-hello-world-1.0.0-SNAPSHOT.jar app.jar

# Expose the port the application will run on (if it were a web app, but for Hello World, it's optional)
# EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
