FROM debian AS builder
LABEL author="Alexandre Hamelin <alexandre.hamelin gmail.com>" \
      maintainer="Alexandre Hamelin <alexandre.hamelin gmail.com>" \
      copyright="Copyright (c) 2019 Alexandre Hamelin <alexandre.hamelin gmail.com>" \
      license="MIT"
RUN apt-get -qq update
RUN apt-get -qqy install git build-essentials
RUN git clone https://github.com/devttyS0/sasquash
RUN cd sasquash && ./build.sh

FROM debian
LABEL author="Alexandre Hamelin <alexandre.hamelin gmail.com>" \
      maintainer="Alexandre Hamelin <alexandre.hamelin gmail.com>" \
      copyright="Copyright (c) 2019 Alexandre Hamelin <alexandre.hamelin gmail.com>" \
      license="MIT"
RUN apt-get -qq update
RUN apt-get -qqy install vim mtd-utils binwalk file less procps dnsutils traceroute whois hping3 netcat lhasa
COPY --from=builder /sasquash/squashfs-tools4-3/sasquash /usr/local/bin/
# Entrypoint installs the qemu tools and other larger packages that we want to
# keep out of the image.
ENTRYPOINT ["/entrypoint.sh"]
