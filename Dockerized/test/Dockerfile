FROM ubuntu
LABEL Aleksandr Krasnov "alekforwork@gmail.com"
USER root
#apt
RUN apt-get update && apt-get install -y git 
#nmap
RUN apt-get install nmap -y
#nikto 
RUN apt-get install nikto -y
COPY main.sh main.sh
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
