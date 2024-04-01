FROM debian:latest
# AS builder

RUN apt update -y && apt upgrade -y && \
    apt install -y \
        make automake autoconf python3 pkg-config m4 libtool libltdl-dev git g++ bison flex

RUN git clone https://gitlab.com/graphviz/graphviz

WORKDIR /graphviz

RUN ./autogen.sh
RUN ./configure
RUN gmake
RUN gmake install

WORKDIR /

# TODO: continue multi-stage build to carry over only the ELF binaries and libraries
    # auto-generated libraries can be found in:
    # - /graphviz/lib/gvc/.libs
    # - /usr/local/lib
    #
    # probably best to follow the files list in the Debian package listings:
    # - https://packages.debian.org/bookworm/amd64/graphviz/filelist