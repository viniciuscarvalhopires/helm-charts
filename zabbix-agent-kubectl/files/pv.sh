#!/bin/bash

# echo "{ \"data\":[" ; kubectl df-pv  | grep -v NAMESPACE | awk '{ if(length($1)) print " { \"{#PV}\":\"" $1 "\" },"}' | sort | uniq | sed -e 's/\//\\\//g' -e '$s/.$//' ; echo " ]}"

echo "{ \"data\":[" ; kubectl df-pv 2> /dev/null | grep -v NAMESPACE | awk '{ if(length($1)) print " { \"{#PV}\":\"" $1 "\", \"{#PVC}\":\"" $2 "\", \"{#NAMESPACE}\":\"" $3 "\", \"{#POD}\":\"" $5 "\" },"}' | sort | uniq | sed -e 's/\//\\\//g' -e '$s/.$//' ; echo " ]}"