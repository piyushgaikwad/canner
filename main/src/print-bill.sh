#!/bin/bash

# Default values in case parameters are not provided
AMOUNT=0
TAXES=0
COUNT=1

# Parse options
while getopts "e:t:c:" opt; do
    case $opt in
        e) AMOUNT=$OPTARG ;;
        t) TAXES=$OPTARG ;;
        c) COUNT=$OPTARG ;;
        \?) echo "Invalid option: -$OPTARG" >&2
            exit 1 ;;
    esac
done

# Calculate the net amount after taxes
NET_AMOUNT=$((AMOUNT - TAXES))

# Output the result, multiplied by the count if specified
FINAL_AMOUNT=$((NET_AMOUNT * COUNT))

echo "Total Amount: $FINAL_AMOUNT"
