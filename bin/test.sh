#!/bin/bash
# Run SoHo Xi testing suite.
# Starts Selenium, The Intern, and cleans up afterward.

#CURRDATE=$(date +"%Y-%m-%d_%H-%M-%S")
#LOG_FILE=./testlog-${CURRDATE}

echo 'Starting SoHo Xi Test Suite...'

killServers ()
{
  SOHO_PID=`ps -eo pid,args | grep "node server" | grep -v grep | cut -c1-6`
  JAR_PID=`ps -eo pid,args | grep -server.jar | grep -v grep | cut -c1-6`
  SERVER_PID=`ps -eo pid,args | grep selenium-server | grep -v grep | cut -c1-6`

  if [[ $SOHO_PID ]]; then
    echo 'SoHo Xi Dev Server process found.  Stopping Dev Server...'
    kill -INT $SOHO_PID
  fi

  if [[ $JAR_PID ]]; then
    echo 'Selenium JAR process found.  Stopping JAR...'
    kill -9 $JAR_PID
  fi

  if [[ $SERVER_PID ]]; then
    echo '"selenium-standalone" server process found.  Stopping "selenium-standalone"...'
    kill -9 $SERVER_PID
  fi
}

# don't run multiple selenium JARs & standalone instances
killServers

# start SoHo Xi Dev Server
# set this up as file descriptor #3
exec 3< <(node server)

while read line; do
   case "$line" in
    *"Soho server is running"*)
      FOUNDSOHO=true
      break
      ;;
   *)
      ;;
   esac
done <&3

if [[!$FOUNDSOHO]]; then
  echo 'Could not find or start a SoHo Xi Dev Server... exiting...'
  exit 1
fi

# start selenium
# set this up as file descriptor #6
exec 6< <(./node_modules/.bin/selenium-standalone start)

while read line; do
   case "$line" in
    *"Selenium started"*)
      FOUNDSELENIUM=true
      break
      ;;
   *)
      ;;
   esac
done <&6

if [[!$FOUNDSELENIUM]]; then
  echo 'Could not find or start a selenium server... exiting...'
  exit 1
fi

# run intern, wait til it finishes
# config=test2/intern.local.functional
./node_modules/.bin/intern-runner config=test2/intern.local.functional &&

# kill the servers when we're done
killServers

# kill file descriptor #3
exec 3<&-

echo 'SoHo Xi Test Suite has been shutdown.'

exit $?