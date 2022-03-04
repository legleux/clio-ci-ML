#!/usr/bin/env bash
docker run --rm -it -v $PWD/clio_src/build:/clio  legleux/clio_tests
