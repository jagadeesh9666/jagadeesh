FROM tomcat:9
LABEL author="jagadeesh"
LABEL app="game of life" 
RUN apt update && apt install openjdk-8-jdk -y
ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/gameoflife.war
EXPOSE 8080
CMD ["catalina.sh" , "run"]