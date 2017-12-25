Just Add Water

# Run the shell commands
# Run the sql
# Create your tables
# Management and operation


# MI Pt 1 - Shell

# TODO 
# - Daemonize postgrest so it runs on reboot

# Install Ubuntu LTS
apt-get update
apt-get upgrade
reboot
apt-get install postgresql postgresql-contrib

# Put these lines into a postgrest.conf file:
# Generate password below before putting into conf file:
db-uri = "postgres://postgres:jwnGgEeRquyX@localhost:5432/postgres"
db-schema = "api"
db-anon-role = "web_anon"
# Generate token below before putting into conf file:
jwt-secret = "5dIZ66nz5qh92BaGhM81OW9apobh9I8B2m6yX4k1Y"
server-port = 80


# Download and run postgrest
wget https://github.com/begriffs/postgrest/releases/download/v0.4.3.0/postgrest-v0.4.3.0-ubuntu.tar.xz
tar Jxf postgrest-v0.4.3.0-ubuntu.tar.xz
./postgrest ./postgrest.conf
