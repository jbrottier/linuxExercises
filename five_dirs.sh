#!/bin/bash
mkdir five
for i in $(seq 5); do
    mkdir "five/dir$i"
    for j in $(seq 4); do
	for n in $(seq $j); do
	    echo "$j"
	done > "five/dir$i/file$j"
    done
done
# rm -r five; ./five_dirs.sh
