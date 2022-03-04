#!/usr/bin/env bash

git clone https://github.com/legleux/clio.git clio_src
pushd clio_src && git checkout clio_deb_package
cmake -B build
cmake --build build --parallel 1
3,978,656
