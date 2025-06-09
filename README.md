# freeswitch-unimrcp

freeswitch-1.10.9
unimrcp-1.8.0

```bash
docker run -it debian:bullseye

sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

apt-get update

apt-get install \
    build-essential cmake automake autoconf 'libtool-bin|libtool' pkg-config \
    libssl-dev zlib1g-dev libdb-dev unixodbc-dev libncurses5-dev libexpat1-dev libgdbm-dev bison erlang-dev libtpl-dev libtiff5-dev uuid-dev \
    libpcre3-dev libedit-dev libsqlite3-dev libcurl4-openssl-dev nasm \
    libogg-dev libspeex-dev libspeexdsp-dev \
    libldns-dev \
    python3-dev \
    libavformat-dev libswscale-dev libavresample-dev \
    liblua5.2-dev \
    libopus-dev \
    libpq-dev \
    libsndfile1-dev libflac-dev libogg-dev libvorbis-dev

echo "/usr/local/lib" >> /etc/ld.so.conf
echo "/usr/lib/x86_64-linux-gnu" >> /etc/ld.so.conf
ldconfig

cd /usr/local/src

# 设置github代理
git config --global url."https://ghproxy.com/https://github.com".insteadOf "https://github.com"


git clone https://github.com/signalwire/libks

git clone https://github.com/freeswitch/sofia-sip

#tag 20230804 install 
git clone https://github.com/freeswitch/spandsp
cd spandsp/
git reset --hard 67d2455efe02e7ff0d897f3fd5636fed4d54549e


curl -o freeswitch-1.10.9.-release.tar.gz https://files.freeswitch.org/releases/freeswitch/freeswitch-1.10.9.-release.tar.gz
mv freeswitch-1.10.9.-release freeswitch
rm -rf freeswitch-1.10.9.-release.tar.gz

# /usr/lib/libks2.so
# /usr/lib/pkgconfig/libks2.pc
# /usr/include/libks2
cd libks/
cmake .
make
make install

#tag /usr/local/lib
cd ../sofia-sip/
./bootstrap.sh
./configure
make
make install

#tag  /usr/local/lib
cd ../spandsp/
./bootstrap.sh
./configure
make
make install

ldconfig

#tag 
cd ../freeswitch/

sed -i '/mod_signalwire/s/^/#/' /usr/local/src/freeswitch/modules.conf
sed -i '/mod_av/s/^/#/' /usr/local/src/freeswitch/modules.conf
sed -i '/mod_verto/s/^/#/' /usr/local/src/freeswitch/modules.conf

# 如果是github拉的代码有这一步，如果是下载tar包解压的没有这一步
# ./bootstrap.sh
./configure
make
make install

sed -i '/mod_av/s|.*|<!-- & -->|' /usr/local/freeswitch/conf/autoload_configs/modules.conf.xml
sed -i '/mod_verto/s|.*|<!-- & -->|' /usr/local/freeswitch/conf/autoload_configs/modules.conf.xml
sed -i '/mod_signalwire/s|.*|<!-- & -->|' /usr/local/freeswitch/conf/autoload_configs/modules.conf.xml

# 安装unimrcp相关模块
cd /usr/local/src
wget https://www.unimrcp.org/project/component-view/unimrcp-deps-1-6-0-tar-gz/download -O unimrcp-deps-1.6.0.tar.gz
tar xvzf unimrcp-deps-1.6.0.tar.gz

cd unimrcp-deps-1.6.0

# /usr/local/apr/lib
cd libs/apr
./configure --prefix=/usr/local/apr
make
make install 

echo "/usr/local/apr/lib" >> /etc/ld.so.conf
ldconfig

cd ..
cd apr-util
./configure --with-apr=/usr/local/src/unimrcp-deps-1.6.0/libs/apr --prefix=/usr/local/apr
make
make install
ldconfig

#  /usr/local/unimrcp/lib
cd /usr/local/src
git clone https://github.com/unispeech/unimrcp.git
cd unimrcp
./bootstrap
./configure
make
make install

#  /usr/local/freeswitch/mod
git clone https://github.com/freeswitch/mod_unimrcp.git
cd mod_unimrcp
export PKG_CONFIG_PATH=/usr/local/freeswitch/lib/pkgconfig:/usr/local/unimrcp/lib/pkgconfig
./bootstrap.sh
./configure
make
make install
cd ..

apt-get install supervisor
```


"# freeswitch-unimrcp" 
