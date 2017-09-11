FROM quay.io/actcat/buildpack_base:latest

MAINTAINER Vexus2 <hikaru.tooyama@gmail.com>

# Install php
RUN apt-get update -y && apt-get install -y php5 php-pear
