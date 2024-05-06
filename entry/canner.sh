#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: canner [command] [options]"
    echo "Commands:"
    echo "  print-bill   Print a bill with specified options."
    echo "  check-amount Check the amount."
    echo "Options for print-bill:"
    echo "  -e [amount]  Specify the amount."
    echo "  -t [taxes]   Specify the taxes."
    echo "  -c [count]   Specify the count."
}

# Check if a command is provided
if [ $# -eq 0 ]; then
    echo "Error: No command provided."
    usage
    #exit 1
fi

# Parse the command
COMMAND="$1"
shift # Remove the command from the arguments list

# Execute based on the command
case "$COMMAND" in
    print-bill)
        AMOUNT=""
        TAXES=""
        COUNT=""

        # Parse options
        while getopts "e:t:c:" opt; do
            case $opt in
                e) AMOUNT=$OPTARG ;;
                t) TAXES=$OPTARG ;;
                c) COUNT=$OPTARG ;;
                \?) usage
                    exit 1 ;;
            esac
        done

        # Call the print-bill script with parameters
        ./main/src/print-bill.sh -e "$AMOUNT" -t "$TAXES" -c "$COUNT"
        ;;

    check-amount)
        # Call the check-amount script
        ./main/src/check-amount.sh
        ;;

    *)
        echo "Error: Unknown command '$COMMAND'."
        usage
       # exit 1
        ;;
        
esac
