FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install curl wget git build-essential sudo -y
RUN apt install lldb-15 clang-15 libomp5-15 libomp-15-dev -y
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-15 200
RUN update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-15 200
RUN update-alternatives --install /usr/bin/lldb lldb /usr/bin/lldb-15 200
RUN apt install ca-certificates gpg wget -y
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null
RUN echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ jammy main' | tee /etc/apt/sources.list.d/kitware.list >/dev/null
RUN apt update
RUN apt install kitware-archive-keyring -y
RUN apt update
RUN apt install cmake -y
RUN cd /usr/local && git clone --recursive https://github.com/facebookincubator/velox.git \
    && cd velox && git checkout 8d01456cf77a56d56c371ecc9509c5ae111157d8 && git submodule sync --recursive && git submodule update --init --recursive
RUN apt install openssh-server -y
RUN apt install nano emacs-nox -y
ADD ./velox.patch /usr/local/velox/
ADD ./velox-install-compatible-spdlog.sh /usr/local/velox/scripts/install-compatible-spdlog.sh
WORKDIR /usr/local/velox
RUN git apply velox.patch
RUN chmod u+x ./scripts/install-compatible-spdlog.sh
RUN ./scripts/setup-ubuntu.sh
RUN make VELOX_BUILD_TESTING=OFF
RUN ./scripts/install-compatible-spdlog.sh
RUN apt install -yy uuid-dev libopenblas-dev libfftw3-dev liblapacke-dev
