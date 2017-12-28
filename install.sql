-- schema
drop schema if exists api;
create schema api;

-- user - anonymous
drop role if exists web_anon;
create role web_anon nologin;
grant web_anon to postgres;
grant usage on schema api to web_anon;
alter default privileges in schema api grant all on sequences to web_anon;

-- user - authenticated
drop role if exists web_authenticated;
create role web_authenticated nologin;
grant web_authenticated to postgres;
grant usage on schema api to web_authenticated;
alter default privileges in schema api grant all on sequences to web_authenticated;
