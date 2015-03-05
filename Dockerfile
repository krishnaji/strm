FROM ubuntu:12.04.5
MAINTAINER Shrikrishna Khose


RUN apt-get update && apt-get install -y vim git chkconfig curl wget unzip tar sysv-rc-conf ntp openjdk-7-jre \
&& /etc/init.d/ntp start 

RUN wget http://public-repo-1.hortonworks.com/HDP/ubuntu12/2.x/GA/2.2.0.0/hdp.list -O /etc/apt/sources.list.d/hdp.list ; gpg --keyserver pgp.mit.edu --recv-keys B9733A7A07513CAD ; gpg -a --export 07513CAD | apt-key add -

RUN apt-get update && apt-get install -y flume flume-agent 

ENV JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 
ENV PATH $PATH:$JAVA_HOME/bin

EXPOSE 65000 8000
CMD "/bin/bash"

