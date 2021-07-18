# Copyright (c) Len Budney.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=debian
FROM $BASE_CONTAINER

LABEL maintainer="Len Budney <len.budney@gmail.com>"

USER root

# Install veracrypt and my GnuPG key
RUN apt-get update \
    && apt-get install -y wget dmsetup libdevmapper1.02.1 libfuse2 sudo openssh-client dnsutils gnupg vim-tiny \
    && wget https://launchpad.net/veracrypt/trunk/1.24-update7/+download/veracrypt-console-1.24-Update7-Debian-9-armhf.deb \
    && dpkg -i ./veracrypt-console-1.24-Update7-Debian-9-armhf.deb \
    && rm -f ./veracrypt-console-1.24-Update7-Debian-9-armhf.deb \
    && gpg --no-tty --recv-keys 3A4F4DDB524D2FA60936EEBA8EF9982800E3B9F8

# Install login/logout scripts
COPY bash_profile /root/.bash_profile
COPY bash_logout /root/.bash_logout

ENTRYPOINT /bin/bash -l

