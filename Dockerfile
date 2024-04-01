FROM ubuntu:latest

RUN apt update -y && apt upgrade -y && \
    apt install -y graphviz