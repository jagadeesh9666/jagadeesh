FROM alpine:3
LABEL work="joip"
LABEL creator="Jagadeesh"
RUN apk add openjdk11
RUN wget https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar
EXPOSE 8080
CMD [ "java", "-jar", "spring-petclinic-2.4.2.jar" ]