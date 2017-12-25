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

-- example API object: "log"
create table api.log (
  id serial primary key,
  namespace text not null,
  message jsonb not null,
  visitor jsonb 
);

grant all on api.log to web_authenticated;
-- typically we would grant select on anonymous requests
-- but since this is a log collector example, we grant only insert
-- so users cannot see all the log entries
grant insert on api.log to web_anon;
grant all on api.log to postgres;
