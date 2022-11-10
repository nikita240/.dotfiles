FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --no-install-recommends --yes \
	zsh git curl ca-certificates vim

WORKDIR /root

COPY . .

ENTRYPOINT [ "zsh" ]
