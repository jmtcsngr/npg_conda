#!/bin/sh

set -ex

n="$CPU_COUNT"

./configure --prefix="$PREFIX" \
            --with-libmaus2="$PREFIX" \
            LDFLAGS="-L$PREFIX/lib -L$PREFIX/lib/irods/externals" \
            LIBS="-lRodsAPIs -lrt"

make -j $n CPPFLAGS="-I$PREFIX/include" \
     LDFLAGS="-L$PREFIX/lib -L$PREFIX/lib/irods/externals"
make install prefix="$PREFIX"
