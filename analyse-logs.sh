#!/bin/bash

LOG="application.log"
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL" "WARNING")

echo "Starting log analysis..."
echo "======================="

find . -name "*.log" -mtime -1

echo -e "\n Line 1 \n Line 2"
grep "${ERROR_PATTERNS[0]}" application.log

grep -c "${ERROR_PATTERNS[2]}" application.log

grep -c "${ERROR_PATTERNS[1]}" application.log
