FROM ubuntu:noble@sha256:728785b59223d755e3e5c5af178fab1be7031f3522c5ccd7a0b32b80d8248123

RUN apt update \
  && apt install -y \
  build-essential \
  curl \
  libelf-dev \
  xz-utils \
  \
  # see: https://docs.kernel.org/process/changes.html#current-minimal-requirements
  bc \
  bindgen \
  bison \
  btrfs-progs \
  clang \
  flex \
  gawk \
  grub2-common \
  global \
  iptables \
  jfsutils \
  kmod \
  libnfs-utils \
  libssl-dev \
  # mcelog
  make \
  nfs-common \
  pahole \
  pcmciautils \
  ppp \
  quota \
  reiserfsprogs \
  rustc \
  # sphinx
  squashfs-tools \
  u-boot-tools \
  udev \
  xfsprogs \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*

RUN useradd builder -G 0 --create-home && \
  mkdir -p /working && \
  chown -R builder:0 /working

WORKDIR /working

USER builder

CMD ["/bin/bash"]
