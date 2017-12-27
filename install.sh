echo "* Downloading nginx & postgresql packages..."
apt-get -y update >/dev/null
apt-get -y upgrade >/dev/null
apt-get -y install nginx postgresql postgresql-contrib >/dev/null

echo "* Installing nginx config"
[ -e nginx.conf ] && mv nginx.conf /etc/nginx/
service nginx restart

echo "* Downloading PostgREST..."
export POSTGREST_VERSION="0.4.3.0"
wget -q https://github.com/begriffs/postgrest/releases/download/v$POSTGREST_VERSION/postgrest-v$POSTGREST_VERSION-ubuntu.tar.xz 
tar Jxf postgrest-v$POSTGREST_VERSION-ubuntu.tar.xz
rm postgrest-v$POSTGREST_VERSION-ubuntu.tar.xz*

echo "Installation complete. Don't forget to edit postgrest.conf. Then run `postgrest.sh` and check :3000."