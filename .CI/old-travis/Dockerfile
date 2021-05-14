FROM phusion/baseimage:focal-1.0.0-alpha1-amd64
MAINTAINER https://alsetlab.github.io

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ARG DEBIAN_FRONTEND=noninteractive
USER root

# Setup  Open Modelica repo
RUN curl -s http://build.openmodelica.org/apt/openmodelica.asc | apt-key add -
RUN add-apt-repository 'deb http://build.openmodelica.org/apt focal stable'

# Install python, omc
RUN apt-get update --fix-missing && apt-get upgrade -y -o Dpkg::Options::="--force-confold" && apt-get install -y \
    python-is-python3 \
    python3-pip \
    python3-dev \
    build-essential \
    python3-numpy \
    omc \
    omlib-modelica-3.2.3

# Install OMPython
RUN python -m pip install -U pip https://github.com/OpenModelica/OMPython/archive/master.zip

# Clean up APT when done.
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add User
RUN useradd -m -s /bin/bash smartslab
RUN chown -R smartslab:smartslab /home/smartslab

USER smartslab
ENV USER smartslab
WORKDIR /home/smartslab
