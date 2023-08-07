FROM ubuntu:20.04

ARG timezone

WORKDIR /app

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=$timezone \
    apt-get install -y python3.9-dev python3-pip \
    gcc libmysqlclient-dev python3-setuptools

COPY requirements.txt requirements.txt
RUN python3.9 -m pip install -r requirements.txt
RUN python3.9 -m pip install asyncmy

COPY . .
CMD python3.9 main.py
