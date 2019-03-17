FROM cloudkernels/debian-rumprun-build:aarch64

MAINTAINER Babis Chalios <babis.chalios@gmail.com>

WORKDIR /tmp
RUN git clone https://github.com/cloudkernels/rumprun-packages.git -b solo5-ext \
	&& cd rumprun-packages \
	&& cp config.mk.dist config.mk \
	&& sed s/x86_64/aarch64/g -i config.mk

WORKDIR rumprun-packages/python3
RUN make -f makefile python.spt LDFLAGS="-lgcc " LDLAST="-lgcc "
RUN make -f makefile python.hvt LDFLAGS="-lgcc " LDLAST="-lgcc "
RUN cp -r python.spt python.hvt ./build /opt
RUN rm -rf /tmp/rumprun-packages

WORKDIR /opt
