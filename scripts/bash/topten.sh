#!/usr/bin/env bash

for filename in file{1..10}; do
    echo "Filename: $filename" >"$filename.txt"
done

for filename in file{1..10}.txt; do
    echo "Filename: $filename"
    rm "$filename"
done