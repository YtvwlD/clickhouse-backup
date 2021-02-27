#!/bin/sh
set -eu
while true
do
    DATE=$(date -I)
    clickhouse client -q "SELECT * FROM $TABLE INTO OUTFILE '$TABLE-$DATE.csv' FORMAT CSVWithNames"
    bzip2 /backup/$TABLE-$DATE.csv
    clickhouse client -q "SHOW CREATE TABLE $TABLE" | sed 's/\\n/\n/g' > /backup/$TABLE-schema-$DATE.sql
    sleep 24h
done
