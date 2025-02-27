#!/bin/bash

sum=0
for n in {1000..2000}; do
	 pattern="[2-9]"
	 if [[ ! $n =~ $pattern ]]; then
	     sum=$((sum + n))
	 fi
done

echo "$sum"

