# You can use alpine, but ubuntu is a good choice since Sleepy-Duck is built for Ubuntu
FROM ubuntu 
LABEL Aleksandr Krasnov "alekforwork@gmail.com"

USER root

RUN apk update && \
    apk upgrade && \
    apk add git && \
    apk add bash && \
    apk add bash-completion

RUN git clone https://github.com/AlekKras/Sleepy-Duck.git && cd Sleepy-Duck
