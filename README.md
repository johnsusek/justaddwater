# Just Add Water

Quickly create a hardened API from a Postgres database using postgrest & nginx. 

## What you need
You should have this information ready:
- postgres user's password (you may need to generate a password for this user on your vps)
- a 32 character randomly generated token, for auth
- a basic starting schema in mind for your project

## Setup
- Edit the .sh, .sql files to suite your needs, using the information you have ready.

## Install
- Run the shell commands in the .sh file
- Run the sql in the .sql file

## Run
- Create some tables to represent your data structures
- `killall -HUP postgrest` to regenerate API from schema

## Security
- Authentication: https://postgrest.com/en/v4.3/tutorials/tut1.html
- nginx: https://postgrest.com/en/v4.3/admin.html#
