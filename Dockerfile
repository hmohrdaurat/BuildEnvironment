FROM ubuntu:latest
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -yy clang-format clang-tidy clang cmake git
