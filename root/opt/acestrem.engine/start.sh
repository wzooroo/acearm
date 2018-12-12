#!/bin/sh

/opt/acestrem.engine/acestream.start >/dev/null 2>&1 &

cd /opt/ && java -jar jaceproxy-1.2.jar --log-level=DEBUG --log-file=/tmp/jaceproxy.log >/dev/null 2>&1 &

while true; do
        sleep 600
        rm -rf /opt/acestrem.engine/androidfs/acestream.engine/.ACEStream/collected_torrent_files/*
done
