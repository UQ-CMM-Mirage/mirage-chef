#!/bin/sh
# Create a dump of the MyTardis Postgres database
cd /var/lib/mytardis/backup
if [ $? != 0 ] ; then
    echo Cannot find directory
    exit 1
fi
/usr/bin/pg_dump mytardis > mytardis-db-dump-`date +%FT%T`
if [ $? != 0 ] ; then
    echo Database dump command failed
    exit 2
fi

if [ $# -gt 0 -a "$1" == "--purgeOld" ] ; then
    # Delete dumps older than 7 days.
    find . -name mytardis-db-dump\* -ctime 7 -exec rm {} \;
fi
