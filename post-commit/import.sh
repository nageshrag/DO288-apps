#!/bin/bash
HOOK_RETRIES=5
HOOK_SLEEP=1
MYSQL_SERVICE_HOST="mysql"
MYSQL_USER="test"
MYSQL_PASSWORD="redhat"
MYSQL_DATABASE="testdb"
echo 'Downloading SQL script that initializes the database...'
curl -O https://raw.githubusercontent.com/nageshrag/DO288-apps/master/post-commit/users.sql -o /tmp/users.sql
echo "Trying $HOOK_RETRIES times, sleeping $HOOK_SLEEP sec between tries:"
while [ "$HOOK_RETRIES" != 0 ]; do
  echo -n 'Checking if MySQL is up...'
  if mysqlshow -h$MYSQL_SERVICE_HOST -u$MYSQL_USER -p$MYSQL_PASSWORD -P3306 $MYSQL_DATABASE &>/dev/null
  then
    echo 'Database is up'
    break
  else
    echo 'Database is down'
    # Sleep to wait for the MySQL pod to be ready
    sleep $HOOK_SLEEP
  fi
  let HOOK_RETRIES=HOOK_RETRIES-1
done
if [ "$HOOK_RETRIES" = 0 ]; then
  echo 'Too many tries, giving up'
  exit 1
fi
echo "list files"
for entry in "/tmp/"/*
do
  echo "$entry"
done

# Run the SQL script
if mysql -h$MYSQL_SERVICE_HOST -u$MYSQL_USER -p$MYSQL_PASSWORD -P3306 $MYSQL_DATABASE < /tmp/users.sql
then
  echo 'Database initialized successfully'
else
  echo 'Failed to initialize database'
exit 2
fi
