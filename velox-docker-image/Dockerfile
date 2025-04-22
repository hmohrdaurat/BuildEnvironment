FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install curl wget git build-essential sudo cmake -y
RUN apt-get install lldb clang -y
RUN cd /usr/local && git clone --recursive https://github.com/facebookincubator/velox.git \
    && cd velox && git checkout 3020196b001130a9027b09d6b3b95385b90bc2cb && git submodule sync --recursive && git submodule update --init --recursive
RUN cd /usr/local/velox && ./scripts/setup-ubuntu.sh
RUN cd /usr/local/velox && make VELOX_BUILD_TESTING=OFF
RUN apt-get install openssh-server -y
RUN apt install nano emacs-nox -y
ADD ./velox.patch /usr/local/velox/
WORKDIR /usr/local/velox
RUN git apply velox.patch
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -yy uuid-dev libopenblas-dev libfftw3-dev liblapacke-dev
