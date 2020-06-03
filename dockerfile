FROM ubuntu:18.04
RUN apt update
RUN apt upgrade -y
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:longsleep/golang-backports -y
RUN apt update
RUN apt install git make unzip curl mysql-server mysql-client golang vim lsof tcpdump nginx iproute2 -y
# RUN curl -fsSL https://get.docker.com -o get-docker.sh
# RUN sh get-docker.sh
WORKDIR /home
# ADD app /home/app
# ADD isucon9-qualify /home/isucon9-qualify
# CMD sh app/init.sh