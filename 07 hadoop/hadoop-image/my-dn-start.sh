#!/usr/bin/env bash

hadoop-daemon.sh --config /usr/local/hadoop/etc/hadoop/ --script hdfs start datanode

while true; do
    sleep 30;
done