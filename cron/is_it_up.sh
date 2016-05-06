#!/bin/bash

# first arg is endpoint
# just checks for 200

endpoint=$1
prefix=$2

if [[ -z $endpoint ]]; then
  echo 'ERROR: no endpoint'
  exit 1
fi

if [[ -z $prefix ]]; then
  echo 'ERROR: no prefix'
  exit 1
fi

statuscode=$(curl -s -w %{http_code} "$endpoint" -o /dev/null)
if [[ $statuscode -ne 200 ]]; then
  redis-cli -n 15 hset "status_check" "$endpoint" "$prefix: NO" &> /dev/null
else
  redis-cli -n 15 hset "status_check" "$endpoint" "$prefix: YES" &> /dev/null
fi
