#!/usr/bin/env bash

# PKGS="boost/1.75.0 bzip2/1.0.8  cassandra-cpp-driver/2.15.3 http_parser/2.9.4  libbacktrace/cci.20210118  libiconv/1.16  libuv/1.41.1  minizip/1.2.11  openssl/1.1.1k  rapidjson/cci.20200410  zlib/1.2.11"
PKGS='bzip2/1.0.8 http_parser/2.9.4 libbacktrace/cci.20210118 libiconv/1.16 libuv/1.41.1 minizip/1.2.11 openssl/1.1.1k zlib/1.2.11'
USER_CHANNEL="legleux/testing"
REMOTE="legleux"
PROFILES="default apple-clang-13"

for i in $PKGS; do
  echo "conan copy $i $USER_CHANNEL --all"
  echo "conan upload ${i}@$USER_CHANNEL -r $REMOTE --all"
done

# ERROR: Missing prebuilt package for

# arch_build=x86_64
# arch=x86_64
# build_type=Release
# compiler.libcxx=libc++
# compiler.version=13.0
# compiler=apple-clang
# os_build=Macos
# os=Macos

#bzip2/1.0.8 http_parser/2.9.4 libbacktrace/cci.20210118 libiconv/1.16 libuv/1.41.1 minizip/1.2.11 openssl/1.1.1k zlib/1.2.11

# ERROR: Missing binary: bzip2/1.0.8:f2848f95be36a5d770fc8e833993b621f703b507
# ERROR: Missing binary: http_parser/2.9.4:e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc
# ERROR: Missing binary: libbacktrace/cci.20210118:e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc
# ERROR: Missing binary: libiconv/1.16:e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc
# ERROR: Missing binary: libuv/1.41.1:e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc
# ERROR: Missing binary: minizip/1.2.11:f5f485c27454218fe1ba78f8aa58ed4710bb0971
# ERROR: Missing binary: openssl/1.1.1k:e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc
# ERROR: Missing binary: zlib/1.2.11:e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc