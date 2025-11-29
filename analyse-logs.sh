#!/bin/bash
echo -e "Analyzing logs...\n"

LOG_DIR="./logs"
ERROR_PATTERNS=("INFO" "WARN" "ERROR")
REPORT_OUT="./report.log"

if [ ! -d "$LOG_DIR" ]; then
    echo "Log directory not found!"
    exit 1
fi

LF=$(find $LOG_DIR -name "*.log")

echo -e "\nLog files in the ${LOG_DIR} directory:"
echo "$LF"
echo "Report created at $(date '+%F %T')" >> $REPORT_OUT
echo -e "Log files in the ${LOG_DIR} directory: \n $LF" >> $REPORT_OUT

for file in $LF; do
    echo -e "\nAnalyzing file: $file"
    for pattern in "${ERROR_PATTERNS[@]}"; do
        COUNT=$(grep -c "$pattern" "$file")
        echo "Number of '$pattern' entries: $COUNT in $file" >> $REPORT_OUT
    done
done