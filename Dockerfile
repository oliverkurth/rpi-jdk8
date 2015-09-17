FROM resin/rpi-raspbian
MAINTAINER Oliver Kurth <okurth@gmail.com>

ENV jdk jdk-8u66-ea-bin-b02-linux-arm-vfp-hflt-28_jul_2015.tar.gz
ENV url http://www.java.net/download/jdk8u66/archive/b02/binaries/${jdk}

RUN apt-get update && apt-get install -y \
   wget

RUN wget ${url}

RUN [ -d /opt ] || mkdir /opt

RUN \
    tar zxf ${jdk} -C /opt && \
    rm ${jdk}

ENV java_dir /opt/jdk1.8.0_66

RUN ln -s ${java_dir} /opt/jdk1.8.0

CMD ["bash"]

