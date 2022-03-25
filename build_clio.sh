#!/usr/bin/env bash

set -e

git clone https://github.com/legleux/clio.git clio_src
pushd clio_src
git checkout master
cp -r ../CMake/packaging CMake/
ls -lh CMake
cmake -B build -DPACKAGE=1
cmake --build build --parallel $(nproc)
cd build && cpack -G DEB
