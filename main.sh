#! /bin/bash

# Clone Upstream
git clone https://github.com/atar-axis/xpadneo -b v0.9.6
cp -rvf ./debian ./xpadneo
cd ./xpadneo
for i in ../patches/* ; do patch -Np1 -i $i; done

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
