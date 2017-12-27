-- This is where you step in and start describing your data structure, then watch the api get generated around it.

-- In this example, we have a log collecting api. Anonymous users will send in log messages to our api.

-- example API object: "logentry"
create table api.logentry (
  id serial primary key,
  namespace text not null,
  message jsonb not null,
  visitor jsonb 
);

-- typically on anonymous requests we would grant select only
-- but since this is a log collector example, we grant only insert
-- this will give anonymous web users access to a POST endpoint on /log
grant select,insert on api.logentry to web_anon;

-- If you have a JWT token set up (see docs), there will be a web_authenticated role for auth'd users
grant all on api.log to web_authenticated;

-- we always give the postgres user permissions for internal use
grant all on api.logentry to postgres;

