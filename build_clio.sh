#!/usr/bin/env bash
# mkdir build && cd build && cmake .. && cmake --build .
cmake -B build && cmake --build build --parallel 32