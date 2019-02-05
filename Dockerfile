FROM cloudkernels/debian-rumprun-build:x86_64

MAINTAINER Babis Chalios <babis.chalios@gmail.com>

WORKDIR /tmp
RUN git clone https://github.com/bchalios/rumprun-packages.git \
	&& cd rumprun-packages \
	&& cp config.mk.dist config.mk

WORKDIR rumprun-packages/python3
RUN make -f makefile python.spt
RUN make -f makefile python.hvt
RUN cp -r python.spt python.hvt ./build /opt
RUN rm -rf /tmp/rumprun-packages

WORKDIR /opt
