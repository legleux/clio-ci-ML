#!/usr/bin/env bash

set -e

./build_clio.sh

./test_clio.sh

./package_clio.sh
