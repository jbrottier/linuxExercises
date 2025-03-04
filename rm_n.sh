#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage Statement: $0 <dir> <n>" 1>&2
    exit 1
fi

DIR="$1"
N="$2"

if [ ! -d "$DIR" ]; then
    echo "dir not found" 1>&2
    exit 1
fi

find "$DIR" -type f -size +"$N"c -exec rm {} +

echo "files removed"
