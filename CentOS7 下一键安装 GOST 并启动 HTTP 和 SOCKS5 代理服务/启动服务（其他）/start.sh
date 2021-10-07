#!/bin/bash
# gost start

nohup gost -L :1081 -F=$1 >/dev/null 2>&1 &