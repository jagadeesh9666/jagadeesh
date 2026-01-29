FROM eclipse-temurin:21-alpine
LABEL author="jagedaesh"
LABEL organization="novar"
LABEL project="learning"
# Copy from local file on Docker host into docker image
COPY spring-petclinic-4.0.0-SNAPSHOT.jar  /spring-petclinic-4.0.0-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar", "spring-petclinic-4.0.0-SNAPSHOT.jar"]
