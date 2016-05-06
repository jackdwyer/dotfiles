#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 
"$DIR/custom/twitter-heartbeat/venv-twitter-heartbeat/bin/python2"  "$DIR/custom/twitter-heartbeat/heartbeat.py" &> /dev/null &

