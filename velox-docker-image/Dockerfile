FROM ghcr.io/little-big-h/dps-docker-image:nightly
ADD ./velox.patch /usr/local/velox/
WORKDIR /usr/local/velox
RUN git apply velox.patch
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -yy uuid-dev libfmt-dev libspdlog-dev libopenblas-dev libfftw3-dev liblapacke-dev
