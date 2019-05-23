#!/bin/sh

set -ex

n="$CPU_COUNT"

./configure \
  --prefix="$PREFIX" \
  --with-zlib="$PREFIX" \
  --with-libcurl="$PREFIX" \
  CPPFLAGS="-I$PREFIX/include"

make -j "$n" LDFLAGS="-Wl,-rpath-link,$PREFIX/lib -Wl,--disable-new-dtags -L$PREFIX/lib"
make install
