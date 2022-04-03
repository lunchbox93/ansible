#!/bin/sh
# Usage: wget https://raw.githubusercontent.com/lunchbox93/scripts/main/ispconfig_install.sh

# nano /etc/network/interfeces
# nano /etc/hostname

apt-get update
apt-get remove *sendmail* *bind* *apache* *postfix* *dovecot*
apt-get -y install curl ntp nano net-tools wget iftop glances

service apparmor stop
update-rc.d -f apparmor remove 
apt-get remove apparmor apparmor-utils

apt-get -y install postfix postfix-mysql postfix-doc mariadb-client mariadb-server openssl getmail4 rkhunter binutils dovecot-imapd dovecot-pop3d dovecot-mysql dovecot-sieve sudo patch

# nano /etc/postfix/master.cf

service postfix restart

mysql_secure_installation

echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root

# nano /etc/mysql/debian.cnf

# nano /etc/security/limits.conf

mkdir /etc/systemd/system/mysql.service.d/

# nano /etc/systemd/system/mysql.service.d/limits.conf

systemctl daemon-reload
service mariadb restart

apt-get -y install amavisd-new spamassassin clamav clamav-daemon unzip bzip2 arj nomarch lzop cabextract apt-listchanges libnet-ldap-perl libauthen-sasl-perl clamav-docs daemon libio-string-perl libio-socket-ssl-perl libnet-ident-perl zip libnet-dns-perl postgrey

service spamassassin stop
update-rc.d -f spamassassin remove

apt-get -y install apache2 apache2-doc apache2-utils libapache2-mod-php php7.4 php7.4-common php7.4-gd php7.4-mysql php7.4-imap php7.4-cli php7.4-cgi libapache2-mod-fcgid apache2-suexec-pristine php-pear libruby libapache2-mod-python php7.4-curl php7.4-intl php7.4-pspell php7.4-sqlite3 php7.4-tidy php7.4-xmlrpc php7.4-xsl memcached php-memcache php-imagick php7.4-zip php7.4-mbstring php-soap php7.4-soap php7.4-opcache php-apcu php7.4-fpm libapache2-reload-perl

a2enmod suexec rewrite ssl actions include cgi alias proxy_fcgi
a2enmod dav_fs dav auth_digest headers

# nano /etc/apache2/conf-available/httpoxy.conf

a2enconf httpoxy

service apache2 restart

apt-get -y install vlogger webalizer awstats geoip-database libclass-dbi-mysql-perl certbot fail2ban ufw

# nano /etc/cron.d/awstats

# nano /etc/fail2ban/jail.local

cd /tmp 
wget -O ispconfig.tar.gz https://www.ispconfig.org/downloads/ISPConfig-3-stable.tar.gz
tar xfz ispconfig.tar.gz
cd ispconfig3*/install/





└─(02:13:43)──> sudo dpkg-reconfigure dash                                                                 1 ↵ ──(Fri,Apr01)─┘
Removing 'diversion of /bin/sh to /bin/sh.distrib by dash'
Adding 'diversion of /bin/sh to /bin/sh.distrib by bash'
Removing 'diversion of /usr/share/man/man1/sh.1.gz to /usr/share/man/man1/sh.distrib.1.gz by dash'
Adding 'diversion of /usr/share/man/man1/sh.1.gz to /usr/share/man/man1/sh.distrib.1.gz by bash'


service clamav-daemon start

a2enmod suexec rewrite ssl actions include cgi
a2enmod dav_fs dav auth_digest headers

a2enconf httpoxy

a2enmod actions proxy_fcgi alias

securemysqlinstall and debian.cnf