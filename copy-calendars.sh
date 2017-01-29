#!/bin/sh

curl https://calendar.google.com/calendar/ical/h0cl2pufaic02ubqj1cdlr9ur0%40group.calendar.google.com/public/basic.ics > bas.ics
curl https://calendar.google.com/calendar/ical/64f2d319jcgv1grt6ae2h3erqg%40group.calendar.google.com/public/basic.ics > haut.ics

git add -u
git commit -m "update"
git push

