#!/bin/bash

TARGET="192.168.0.90"
USER="inf"
PASS="x2soft!@#$"
DB="influencer"

if [ ! -e /tmp/import.pid ]
then
        touch /tmp/db_backup.pid
	
	echo "dump start"
	mysqldump --column-statistics=0 -h$TARGET -u$USER -p'$PASS' $DB > ./$DB.sql
	mysqladmin -u$USER -p'$PASS' drop $DB
	mysqladmin -u$USER -p'$PASS' create $DB
		
	echo "import start"
	mysql -u$USER -p'$PASS' $DB < ./$DB.sql
       
  rm -rf /tmp/import.pid

fi

