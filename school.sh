#!/bin/bash


cat Property_Tax_Roll.csv | grep "MADISON SCHOOLS" | cut -d',' -f7 |{
    sum=0
    count=0
    while read n; do
	sum=$((sum + n))
	count=$((count + 1))
    done

    echo "sum: $sum"
    echo -n "avg: "
    echo "scale=2; $sum / $count" | bc
}

    
#v1.2


