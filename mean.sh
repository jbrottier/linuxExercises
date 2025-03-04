#!/bin/bash

# Find mean of <column> from <file>

# Creating the Usage Notice
if [[  $# -lt 1 || $# -gt 2 ]]; then
    echo "Usage: $0 <column> [<file>], if <file> not provided, it is read from standard input." 1>&2
    exit 1
fi

# Creating the variables
column=$1
file=${2:-/dev/stdin}

# Performing the calculations
{
    sum=0
    count=0

    # Loop through the column
    while read -r value; do
        # May need to add check to make sure numeric values
        sum=$(echo "$sum + $value" | bc)
        count=$((count + 1))
    done < <(tail -n +2 "$file" | cut -d',' -f"$column")

    # Calculate the mean
    if [[ $count -gt 0 ]]; then
        mean=$(echo "scale=4; $sum / $count" | bc)
        echo "For column $column, the mean is $mean"
    else
        echo "Invalid Data in $column" 1>&2
	exit 1
    fi
}
