FROM rust:1.59-slim-buster

WORKDIR /usr/src/myapp
COPY ./src .

