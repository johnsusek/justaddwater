apt-get update
apt-get upgrade
apt-get install postgresql postgresql-contrib

# Download and run postgrest
wget https://github.com/begriffs/postgrest/releases/download/v0.4.3.0/postgrest-v0.4.3.0-ubuntu.tar.xz
tar Jxf postgrest-v0.4.3.0-ubuntu.tar.xz
./postgrest ./postgrest.conf
