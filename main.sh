# Clone Upstream
git clone https://github.com/atar-axis/xpadneo -b v0.9.5
cp -rvf ./debian ./xpadneo
cd ./xpadneo

# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p xpadneo_0.9.5
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
