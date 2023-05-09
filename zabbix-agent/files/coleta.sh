#!/bin/bash

PV=$1
COLUMN=$2

kubectl df-pv 2> /dev/null | grep -w $PV | awk '{ if(length($1)) print $'$COLUMN'}' | sed 's/\x1b\[[0-9;]*m//g'