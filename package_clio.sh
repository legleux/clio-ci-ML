#!/usr/bin/env bash


echo "PWD: $PWD"
ls -lh

echo "clio_src:"
ls ./clio_src

cd ./clio_src/build
echo "clio_src/build:"
ls -lh

cpack -G DEB
cat _CPack_Packages/Linux/DEB/PreinstallOutput.log
