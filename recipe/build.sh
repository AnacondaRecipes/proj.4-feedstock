#!/bin/bash

./configure --prefix=$PREFIX --without-jni --host=$HOST

make -j$CPU_COUNT
# skip tests on linux32 due to rounding error causing issues
if [ $(getconf LONG_BIT) -ge 64 ]; then
    make check
fi
make install

ACTIVATE_DIR=$PREFIX/etc/conda/activate.d
DEACTIVATE_DIR=$PREFIX/etc/conda/deactivate.d
mkdir -p $ACTIVATE_DIR
mkdir -p $DEACTIVATE_DIR

cp $RECIPE_DIR/scripts/activate.sh $ACTIVATE_DIR/proj4-activate.sh
cp $RECIPE_DIR/scripts/deactivate.sh $DEACTIVATE_DIR/proj4-deactivate.sh
