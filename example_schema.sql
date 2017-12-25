-- This is where you step in and start describing your data structure, then watch the api get generated around it.

-- In this example, we have a log collecting api. Anonymous users will send in log messages to our api.

-- example API object: "log"
create table api.log (
  id serial primary key,
  namespace text not null,
  message jsonb not null,
  visitor jsonb 
);

-- typically we would grant select only on anonymous requests
-- but since this is a log collector example, we grant only insert
grant insert on api.log to web_anon;

grant all on api.log to web_authenticated;
grant all on api.log to postgres;
