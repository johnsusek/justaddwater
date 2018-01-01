# Just Add Water

Serves a REST API automatically generated from a postgres database. Should be run on a fresh VPS/VM.

## Prerequisites

You should have this ready:

* The `postgres` user's password (you may need to create one)
* A 32 character randomly generated token, for JWT authentication
* A subdomain pointing to this machine with an A record

## Installation

* Run the shell commands in the install.sh file as `root`
* Answer questions during SSL setup...
* Run the sql in the install.sql file as `postgres`
* Edit the `postgrest.conf` file and enter the postgres password and jwt token from the previous section
* Edit the `nginx.conf` file and enter the subdomain where you are hosting this (e.g. api.example.com)

## Operation

* Start the daemon with `./postgrest.sh`
* Create some tables to represent your data structures
* Check swagger docs for changes (`/` on port `3000`).
* `killall -HUP postgrest` to regenerate new keys/relationships
* Edit nginx and add routes you want available to public

## Debugging

* Check `/var/log/postgrest.log`
* Check `/var/log/nginx/error.log`
* 502 Bad Gateway: Make sure postgrest is running
* Try your request on port `3000`, which bypasses nginx.

## Security Hardening

* Change the ssh port to `2222`: `sed -i 's/^Port 22/Port 2222/' /etc/ssh/sshd_config`
* Restart ssh (may need to reconnect): `service ssh restart`
* Start firewall and only allow `2222`,`80`,`443`: `ufw disable && ufw reset && ufw default deny && ufw allow proto tcp from any to any port 2222,80,443 && ufw enable`
* During development you might want to allow port `3000` for debugging: `ufw allow 3000`

## Authentication

* Authentication with JWT: https://postgrest.com/en/v4.3/tutorials/tut1.html

## Reliability

* Add server to uptime check service
* Set a reminder to regularly apt-get upgrade
* Don't forget to check the firewall before launch (turn off port 3000)
* Don't use a stupid root password

## Additional Reading

http://postgrest.com/en/latest/
https://nginx.org/en/docs/
http://petstore.swagger.io - Paste http://your_hostname:3000 into this to see your API docs
