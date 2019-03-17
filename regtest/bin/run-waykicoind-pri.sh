
docker run --name waykicoind-pri -p 1920:18920 -p 1968:6968 \
  -v `pwd`/conf/WaykiChain.conf:/root/.WaykiChain/WaykiChain.conf \
  -v `pwd`/data:/root/.WaykiChain/regtest \
  -v `pwd`/bin:/opt/wicc/bin \
  -v `pwd`/lua:/tmp/lua \
  -d wicc/waykicoind


