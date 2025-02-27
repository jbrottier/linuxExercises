#!/bin/bash

# Find mean of <column> from <file>

# NOTE ** May need to fix this if the file is passed through standard input
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <column> <file>" 1>&2
    exit 0
fi

# Creating the variables
column=$1
file=$2

# Getting the file from standard input if no argument is passed
if [[ -z $file ]]; then
    file=/dev/stdin
fi

col=$(cut -d',' -f"$column" "$file")
