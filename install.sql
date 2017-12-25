-- database
create schema api;

-- user - anonymous
create role web_anon nologin;
grant web_anon to postgres;
grant usage on schema api to web_anon;
grant usage on all sequences in schema api TO web_anon;

-- user - authenticated
create role web_authenticated nologin;
grant web_authenticated to postgres;
grant usage on schema api to web_authenticated;
grant usage, select on all sequences in schema api to web_authenticated;
