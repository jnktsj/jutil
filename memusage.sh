#!/bin/bash
while 1; do
  free -m | grep "Mem" | awk '{print $(NF-1)}' >> memory_use_log
  sleep 60
done
