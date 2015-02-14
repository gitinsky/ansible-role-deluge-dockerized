FROM gitinsky/baseimage:0.1.1
MAINTAINER Git In Sky <support@gitinsky.com>
EXPOSE 8112

RUN apt-get update && apt-get -y install bash wget python python-pip python-twisted python-twisted-web python-openssl python-simplejson python-setuptools intltool python-xdg python-chardet geoip-database python-libtorrent python-notify python-pygame python-glade2 librsvg2-common xdg-utils python-mako && mkdir /opt/deluge && cd /opt/deluge && wget http://download.deluge-torrent.org/source/deluge-1.3.6.tar.gz && tar -zxf deluge-1.3.6.tar.gz && cd deluge-1.3.6/deluge/core && cp core.py core.py.orig && wget https://gist.github.com/vasnake/8436923/raw/c5a7e7bd3b135a4aa7d62cbc6b720e22d9d32f6c/deluge.core.py.patch && patch core.py < deluge.core.py.patch && cd /opt/deluge/deluge-1.3.6 && pip install virtualenv && virtualenv --system-site-packages env && bash -c "cd /opt/deluge/deluge-1.3.6 && source env/bin/activate && python setup.py clean -a && python setup.py build && python setup.py develop"
VOLUME /gogs-repositories/
ADD deluge.rb /etc/eye/deluge.rb
ADD deluge-web.sh /deluge-web.sh
