#!/usr/bin/env bash

git clone https://github.com/legleux/clio.git clio_src
pushd clio_src && git checkout clio_deb_package && popd

ls -l
cmake -S /clio_src/ -B  /clio_src/build/
cmake --build /clio_src/build --parallel $(nproc)
