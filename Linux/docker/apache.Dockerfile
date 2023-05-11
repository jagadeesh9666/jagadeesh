FROM ubuntu
LABEL purpose="installation"
LABEL owner="jagadeesh"
RUN sudo apt update
RUN sudo install apache2
EXPOSE 8080