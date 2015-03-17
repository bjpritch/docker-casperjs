
FROM fedora:20
MAINTAINER Ben Pritchett <bjpritch@redhat.com>
# Required packages
RUN yum install -y vim gcc gcc-c++ make git openssl-devel freetype fontconfig libfreetype.so.6 libfontconfig.so.1 libstdc++.so.6 nodejs npm bzip2; yum update -y; yum clean all

# phantom version
ENV PHANTOMJS_VERSION 1.9.8
ENV PHANTOMJS_CDNURL http://cnpmjs.org/downloads
# Install casperjs and phantomjs
RUN npm install -g casperjs
# Symlink PhantomJS
RUN ln -s /usr/lib/node_modules/casperjs/node_modules/phantomjs/lib/phantom/bin/phantomjs /usr/bin/phantomjs
