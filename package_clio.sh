#!/usr/bin/env bash

docker run --rm -v $PWD/clio_src:/clio_src -it legleux/clio_builder \
    bash -c "cd /clio_src/build && cpack -G DEB"
