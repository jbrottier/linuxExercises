#!/bin/bash

sum=0
count=0

grep "MADISON SCHOOLS" Property_Tax_Roll.csv | cut -d ',' --complement -f 7 | while read n; do
    sum=$((sum + n))
    count=$((count + 1))
done
if [$count -gt 0]; then
    avg=$((sum/count))
else
    avg=0
fi
     echo "$sum,$avg" >> Property_Tax_Roll.csv
	   

   

#{		 sum = 0; while read n; do sum$(($sum + $n)); done; echo $sum;} #finds the sum

 #   | {output = 0; while read n; do sum=$(($sum+$n)) do avg = $(($sum/$n)); done, echo $sum && $avg} >> Property_Tax_Roll.csv



