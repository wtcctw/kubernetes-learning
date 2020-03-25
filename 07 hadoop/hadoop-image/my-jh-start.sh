#!/usr/bin/env bash

mr-jobhistory-daemon.sh --config /usr/local/hadoop/etc/hadoop/ start historyserver

while true; do
    sleep 30;
done