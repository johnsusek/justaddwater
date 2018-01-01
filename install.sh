echo "* Updating all packages..."
apt-get -y update &>/dev/null
apt-get -y upgrade &>/dev/null
echo "* Installing nginx & postgresql packages..."
apt-get -y install nginx postgresql postgresql-contrib postgresql-server-dev-all build-essential &>/dev/null
echo "shared_preload_libraries='safeupdate'" >> /etc/postgresql/9.5/main/postgresql.conf;
service postgresql restart

echo "* Copying nginx config..."
[ -e nginx.conf ] && cp nginx.conf /etc/nginx/
service nginx restart

echo "* Installing certbot to get an ssl cert for this server..."
apt-get install software-properties-common &>/dev/null
add-apt-repository -y ppa:certbot/certbot
apt-get -y update &>/dev/null
apt-get -y install python-certbot-nginx &>/dev/null
certbot --nginx

echo "* Downloading PostgREST..."
POSTGREST_VERSION="0.4.3.0"
wget -q https://github.com/begriffs/postgrest/releases/download/v$POSTGREST_VERSION/postgrest-v$POSTGREST_VERSION-ubuntu.tar.xz 
tar Jxf postgrest-v$POSTGREST_VERSION-ubuntu.tar.xz
rm postgrest-v$POSTGREST_VERSION-ubuntu.tar.xz*

echo "* Switching ssh to 2222"
sed -i 's/^Port 22/Port 2222/' /etc/ssh/sshd_config
service ssh restart

echo "* Configuring firewall for 2222,80,443";
ufw default deny incoming
ufw default allow outgoing
ufw allow proto tcp from any to any port 2222,80,443
ufw enable

echo "Installation complete. Don't forget to edit postgrest.conf. Then run postgrest.sh."