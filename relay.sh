#!/bin/bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
    echo "Usage: relay.sh <station 1-8> <0|1>" >&2
    exit 1
fi

station=$1
onoff=$2

if [[ ! "$station" =~ ^[1-8]$ ]]; then
    echo "Error: station must be 1-8" >&2
    exit 1
fi

if [[ ! "$onoff" =~ ^[01]$ ]]; then
    echo "Error: onoff must be 0 or 1" >&2
    exit 1
fi

if (( station <= 4 )); then
    addr=0x12
    reg=$station
else
    addr=0x10
    reg=$(( station - 4 ))
fi

reg=$(printf "0x%02x" "$reg")
val=$(printf "0x%02x" "$onoff")

# echo "i2cset -y 1 $addr $reg $val"
i2cset -y 1 "$addr" "$reg" "$val"
