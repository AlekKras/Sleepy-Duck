FROM jenkins
ADD intro.sh /root/intro.sh
ADD start.sh /root/start.sh
USER root
RUN apt-get update && apt-get install -y ruby
USER jenkins
CMD [./script]
