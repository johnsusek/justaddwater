-- database
drop database if exists api;
create database api;

-- schema
-- drop schema if exists api;
-- create schema api;

-- user - anonymous
drop role if exists web_anon;
create role web_anon nologin;
grant web_anon to postgres;
grant usage on schema public to web_anon;

-- user - authenticated
drop role if exists web_authenticated;
create role web_authenticated nologin;
grant web_authenticated to postgres;
grant usage on schema public to web_authenticated;

-- default privileges
--alter default privileges for role web_anon grant usage on schema public to web_anon;
-- alter default privileges in schema public grant all on sequences to web_anon;
--alter default privileges for role web_authenticated grant usage on schema public to web_authenticated;
-- alter default privileges in schema public grant all on sequences to web_authenticated;
-- grant usage on all sequences in schema public TO web_anon;
-- grant usage, select on all sequences in schema public to web_authenticated;
