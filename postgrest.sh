IP=`ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/'`

if pgrep -x "postgrest" >/dev/null
then
  killall postgrest
fi

echo "Starting PostgREST server..."
LOG_LOCATION="/var/log/postgrest.log"
./postgrest postgrest.conf </dev/null >>$LOG_LOCATION 2>&1 & >/dev/null

if [ $? -eq 0 ]; then
  echo "http://$IP:3000"
  echo "Hint: Do a File -> Import URL at http://editor.swagger.io/#!/"
else
  echo "It looks like something went wrong. Look at $LOG_LOCATION?"
fi
