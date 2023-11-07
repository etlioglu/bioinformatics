#!/usr/bin/env bash

# write the header in a new file and append the shuffled rows to that very file with <()
head -n 1 "file.csv" >"new-file.csv" && shuf <(tail -n +2 "file.csv") >>"new-file.csv"
