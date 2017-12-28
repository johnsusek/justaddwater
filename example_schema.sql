-- This is where you step in and start describing your data 
-- structure, then watch the api get generated around it.

-- In this example, we have a log collecting api. Anonymous users
--  will send in log messages to our api.

-- example API object: "log entries"
create table api.entries (
  id serial primary key,
  namespace text not null,
  message jsonb not null,
  visitor jsonb 
);

-- typically on anonymous requests we would grant select only
-- but since this is a log collector example, we grant insert too
revoke all on api.entries from web_anon;
grant select,insert on api.entries to web_anon;
grant usage on all sequences in schema api TO web_anon;

-- If you have a JWT token set up (see docs), there will be a 
-- web_authenticated role for auth'd users
revoke all on api.entries from web_authenticated;
grant all on api.entries to web_authenticated;
grant usage on all sequences in schema api TO web_authenticated;

-- we always give the postgres user permissions for internal use
grant all on api.entries to postgres;
