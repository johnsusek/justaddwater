-- database
drop schema if exists api;
create schema api;

-- user - anonymous
drop role if exists web_anon;
create role web_anon nologin;
grant web_anon to postgres;
grant usage on schema api to web_anon;
grant usage on all sequences in schema api TO web_anon;

-- user - authenticated
drop role if exists web_authenticated;
create role web_authenticated nologin;
grant web_authenticated to postgres;
grant usage on schema api to web_authenticated;
grant usage, select on all sequences in schema api to web_authenticated;

