#!/usr/bin/env bash

yarn-daemon.sh --config /usr/local/hadoop/etc/hadoop/ start resourcemanager

while true; do
    sleep 30;
done