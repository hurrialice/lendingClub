#!/usr/bin/env bash

## These files are not standard csv files. There are notes lines
## at the beginning, at the end and in the middle.

# LoanStats file

### Creat header
unzip -p rawdata/LoanStats_2016Q1.csv.zip | head -n 2 | tail -n 1 > LoanStats.csv

for file in rawdata/LoanStats*.csv.zip; do
  unzip -p $file | grep "^\"" | tail -n +2 >> LoanStats.csv
done


# RejectStats file

unzip -p rawdata/RejectStats_2016Q1.csv.zip | head -n 2 | tail -n 1 > RejectStats.csv

for file in rawdata/RejectStats*.csv.zip; do
  unzip -p $file | grep "^\"" >> RejectStats.csv
done
