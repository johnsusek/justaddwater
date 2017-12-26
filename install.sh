apt-get -Y update
apt-get -Y upgrade
apt-get -Y install nginx postgresql postgresql-contrib 

mv nginx.conf /etc/nginx/
service nginx restart

export POSTGREST_VERSION = "0.4.3.0"
wget https://github.com/begriffs/postgrest/releases/download/v${POSTGREST_VERSION}/postgrest-v${POSTGREST_VERSION}-ubuntu.tar.xz
tar Jxf postgrest-v{$POSTGREST_VERSION}-ubuntu.tar.xz
