#!/bin/sh
unset http_proxy
unset ALL_PROXY

cd `dirname $0`

if ! /sbin/ping -t2 calendar.google.com ; then
  echo "Can't ping calendar.google.com, assuming behind firewall and exiting"
  exit 0
fi


curl https://calendar.google.com/calendar/ical/h0cl2pufaic02ubqj1cdlr9ur0%40group.calendar.google.com/public/basic.ics > bas.ics
curl https://calendar.google.com/calendar/ical/64f2d319jcgv1grt6ae2h3erqg%40group.calendar.google.com/public/basic.ics > haut.ics

if git diff|grep '^[-+]'|grep -v DTSTAMP|egrep -v '^(---|\+\+\+)'; then

  echo "Changes detected - committing and pushing"
  git add -u
  git commit -m "update"
  git push
else
  echo "No changes detected"

fi

