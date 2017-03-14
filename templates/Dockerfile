FROM gitinsky/baseimage:0.2.1
MAINTAINER Git In Sky <support@gitinsky.com>
EXPOSE 8112

RUN apt-get update && apt-get -y install bash wget python python-pip python-twisted python-twisted-web python-openssl python-simplejson python-setuptools intltool python-xdg python-chardet geoip-database python-libtorrent python-notify python-pygame python-glade2 librsvg2-common xdg-utils python-mako && mkdir /opt/deluge && cd /opt/deluge && wget http://download.deluge-torrent.org/source/deluge-1.3.14.tar.gz && tar -zxf deluge-1.3.14.tar.gz && cd deluge-1.3.14/deluge/core && cd /opt/deluge/deluge-1.3.14 && pip install virtualenv && virtualenv --system-site-packages env && bash -c "cd /opt/deluge/deluge-1.3.14 && source env/bin/activate && python setup.py clean -a && python setup.py build && python setup.py develop" && mkdir /Downloads && rm /etc/container_environment.sh && rm /etc/container_environment.json
ADD deluge.rb /etc/eye/deluge.rb
ADD deluge-web.sh /deluge-web.sh
VOLUME /tmp
VOLUME /Downloads
VOLUME /var/lib/deluge/.config/deluge
VOLUME /etc/container_environment
VOLUME /etc/container_environment.sh
VOLUME /etc/container_environment.json
VOLUME /var/run
VOLUME /var/log/eye
