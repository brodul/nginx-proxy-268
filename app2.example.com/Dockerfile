
FROM ubuntu:14.04.3
MAINTAINER Andraz Brodnik <brodul@brodul.org>

RUN locale-gen en_US en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive


RUN apt-get -q update && apt-get install -y \
  build-essential \
  git \
  libffi-dev \
  libmysqlclient-dev \
  libxml2-dev \
  libxmlsec1-dev \
  libxslt1-dev \
  nano \
  nginx-full \
  nodejs \
  npm \
  openssh-server \
  python \
  python-dev \
  python-mysqldb \
  python-pip \
  python-setuptools \
  python-virtualenv \
  ruby-dev \
  software-properties-common \
  sqlite3 \
  supervisor \
  swig \
  vim \
  mysql-client-5.6


RUN mkdir /app

RUN pip install pyramid==1.5.7

COPY ./app.py /app/app.py
COPY ./wrapper.sh /app/wrapper.sh
COPY ./app2.txt /app/app2.txt
# COPY ./cert.pem /app/cert.pem

EXPOSE 8001

ENTRYPOINT ["/app/wrapper.sh"]
