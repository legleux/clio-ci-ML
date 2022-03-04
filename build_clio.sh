#!/usr/bin/env bash


 grep MemTotal /proc/meminfo

git clone https://github.com/legleux/clio.git clio_src
pushd clio_src && git checkout clio_deb_package
cmake -B build
cmake --build build --parallel $(nproc)
