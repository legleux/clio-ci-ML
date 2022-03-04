#!/usr/bin/env bash

docker run hello-world

git clone https://github.com/legleux/clio.git clio_src
pushd clio_src && git checkout clio_deb_package && popd
docker run --rm -v $PWD/clio_src:/clio_src -it legleux/clio_builder \
    bash -c "cmake -S /clio_src/ -B  /clio_src/build/ && cmake --build /clio_src/build --parallel $(nproc)"
