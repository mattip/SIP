#!/usr/bin/python3

import relay_lib_seeed
import sys
if len(sys.argv) < 3:
    print("call as %s <relay> [0,1]" % sys.argv[0])
    exit(1)
station = int(sys.argv[1])
if station > 4:
    import relay_56
else:
    if sys.argv[2] == '1':
        relay_lib_seeed.relay_on(station)
    else:
        relay_lib_seeed.relay_off(station)
