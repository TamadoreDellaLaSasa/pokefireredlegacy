#!/bin/bash
# Fix agbcc build for Mac after cloning

# Clone agbcc if not present
if [ ! -d "tools/agbcc" ]; then
    git clone https://github.com/pret/agbcc tools/agbcc
fi

# Build agbcc
cd tools/agbcc
./build.sh
cd ../..

# Copy binaries to bin/
mkdir -p tools/agbcc/bin
cp tools/agbcc/agbcc tools/agbcc/bin/agbcc
cp tools/agbcc/old_agbcc tools/agbcc/bin/old_agbcc
cp tools/agbcc/agbcc_arm tools/agbcc/bin/agbcc_arm

# Copy headers
cp tools/agbcc/libc/include/*.h tools/agbcc/include/
cp -r tools/agbcc/libc/include/sys tools/agbcc/include/
cp -r tools/agbcc/libc/include/machine tools/agbcc/include/
cp tools/agbcc/ginclude/*.h tools/agbcc/include/

# Copy libraries
mkdir -p tools/agbcc/lib
cp tools/agbcc/libgcc.a tools/agbcc/lib/
cp tools/agbcc/libc.a tools/agbcc/lib/

echo "Done! Now run: make tools && make"
