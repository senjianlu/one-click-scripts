#!/bin/bash
# gost start

nohup gost -L :$1 -F=$2 >/dev/null 2>&1 &