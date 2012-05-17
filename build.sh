#!/bin/bash -ex
#
# Build the passenger-common package
#

pushd ..

#
# Install prereqs
#
apt-get install -y apache2-threaded-dev debhelper doxygen asciidoc graphviz cdbs source-highlight libev-dev rubygems

#
# clone passenger
#
[ -d "passenger" ] || git clone https://github.com/FooBarWidget/passenger.git

pushd passenger
rake fakeroot
rm -rf passenger-common/usr
cp -a pkg/fakeroot/usr ../passenger-common/
popd
pushd passenger-common
dpkg-buildpackage -uc -nc
popd
popd
 