#!/usr/bin/env bash
if [ ! -d "/usr/local/hadoop/hadoopdata/namenode" ]; then
   hdfs namenode -format
fi