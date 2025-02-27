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

# Loop through the column to calculate the sum
{
    sum=0
    count=0

    # Use process substitution to avoid subshell issues
    while read -r value; do
        # Will have to change this so that it handles more than integer add
        sum=$(echo "$sum + $value" | bc)
        count=$((count + 1))
    done < <(tail -n +2 "$file" | cut -d',' -f"$column")

    # Calculate the mean
    if [[ $count -gt 0 ]]; then
        mean=$(echo "scale=4; $sum / $count" | bc)
        echo "For column $column, the mean is $mean"
    else
        echo "Invalid Data in $column"
    fi
}
