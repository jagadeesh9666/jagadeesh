FROM ubuntu:22.04
LABEL purpose="installation"
LABEL owner="jagadeesh"
RUN sudo apt update
RUN sudo apt install apache2
EXPOSE 8080
CMD [ "sleep", "1d" ]