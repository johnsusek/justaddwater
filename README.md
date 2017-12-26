# Just Add Water

Quickly create a hardened API from a Postgres database using postgrest & nginx.

## What you need

You should have this information ready:

* postgres user's password (you may need to generate a password for this user on your vps)
* a 32 character randomly generated token, for auth
* a basic starting schema in mind for your project

## Setup

* Edit the install.sh and install.sql files to suit your needs

## Install

* Run the shell commands in the .sh file
* Run the sql in the .sql file

## Operation

* `./postgrest ./postgrest.conf </dev/null >/var/log/postgrest.log 2>&1 &`
* Create some tables to represent your data structures
* `killall -HUP postgrest` to regenerate API from schema

## Debugging

## Security

* Authentication with JWT: https://postgrest.com/en/v4.3/tutorials/tut1.html
* nginx: https://postgrest.com/en/v4.3/admin.html#
