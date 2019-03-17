FROM phusion/baseimage:0.9.18
MAINTAINER Dragon Master

ENV HOME /opt/wicc

# Install prrequisite components
COPY ./sources.list /etc/apt

RUN echo exit 0 > /usr/sbin/policy-rc.d
RUN add-apt-repository ppa:bitcoin/bitcoin -y && apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libdb4.8-dev libdb4.8++-dev git-core

# Build Waykichain source for mainnet
RUN mkdir -p /opt/src /opt/wicc && cd /opt/src && git clone https://github.com/WaykiChain/WaykiChain.git
RUN cd /opt/src/WaykiChain/linux_shell &&  sh ./linux.sh && cd .. && sh ./autogen-coin-man.sh coin && chmod +x ./share/genbuild.sh && make && cp /opt/src/WaykiChain/src/coind /opt/wicc/ && cp ./WaykiChain.conf /opt/wicc/ && rm -rf /opt/src

EXPOSE 6968 8920 18920
WORKDIR /opt/wicc

CMD ["./coind", "-datadir=."]
