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

* `./postgrest.sh`
* Create some tables to represent your data structures
* `killall -HUP postgrest` to regenerate API from schema
* Check swagger docs for changes (/ on port 3000)
* Edit nginx and add routes you want available to public

## Debugging

* Check `/var/log/postgrest.log`
* Check `/var/log/nginx/error.log`
* 502 Bad Gateway: Make sure postgrest is running
* Try your request on port 3000, which bypasses the nginx proxy, but also allows all http routes/verbs.

## Security Hardening

* Firewall everything except ports `22`, `80`, and `443`
* nginx runs on port 80, and proxys postgrest which is running on port 3000
* Authentication with JWT: https://postgrest.com/en/v4.3/tutorials/tut1.html
* nginx: https://postgrest.com/en/v4.3/admin.html#

## Performance

(benchmarking)

## Additional Reading

http://postgrest.com/en/latest/
https://nginx.org/en/docs/
