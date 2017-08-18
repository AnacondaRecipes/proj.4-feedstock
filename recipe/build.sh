#!/bin/bash

./configure --prefix=$PREFIX --without-jni

export CFLAGS="-O2 -Wl,-S $CFLAGS"

make -j$CPU_COUNT
make check -j$CPU_COUNT
make install -j$CPU_COUNT

ACTIVATE_DIR=$PREFIX/etc/conda/activate.d
DEACTIVATE_DIR=$PREFIX/etc/conda/deactivate.d
mkdir -p $ACTIVATE_DIR
mkdir -p $DEACTIVATE_DIR

cp $RECIPE_DIR/scripts/activate.sh $ACTIVATE_DIR/proj4-activate.sh
cp $RECIPE_DIR/scripts/deactivate.sh $DEACTIVATE_DIR/proj4-deactivate.sh
