#!/usr/bin/env bash

# find all "*.txt" files
find -name "*.txt"

# find the string "Apple" in all "*.txt" files
find -name "*.txt" | xargs grep Apple

# look for "Banana" in all files (including symlinks, -r for no symlinks)
grep -R Banana .

# same as above but only look for files with the "*.txt" extension
grep -r --include "*.txt" Banana .