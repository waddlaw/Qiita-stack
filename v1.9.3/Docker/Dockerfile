FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y \
  curl \
  wget \
  tree \
  vim \
  libtinfo-dev
RUN curl -sSL https://get.haskellstack.org/ | sh

COPY .bashrc /root/.bashrc

RUN stack --version
RUN stack update
RUN tree ~/.stack/
RUN stack new PFAD
RUN cd PFAD