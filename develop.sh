#!/bin/sh

set -e

cmake .
make -j64 DESTDIR=/tmp/bla install

rsync -av --delete-during /tmp/bla/usr/local/ /Users/shiretu/work/evostream/builders/cmake/external_libs/usrsctp
rsync -av /tmp/bla/usr/local/ /Users/shiretu/work/evostream/builders/nodejs/externals/x86_64
rm -rfv /Users/shiretu/work/evostream/builders/nodejs/externals/x86_64/lib/*.dylib

# ( \
#     cd /Users/shiretu/work/evostream/builders/cmake; \
#     ninja evostreamms; \
#     ./evostreamms/evostreamms config.lua \
# )

( \
    cd /Users/shiretu/work/evostream/builders/nodejs; \
    find . -name *.node|xargs rm -rfv; \
    ./run \
)

# ( \
#     cd /Users/shiretu/work/evostream/builders/cmake; \
#     ninja ubnt_webrtc_tests; \
#     ./ubnt_webrtc_tests/ubnt_webrtc_tests -o \
# )
