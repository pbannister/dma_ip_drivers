#!/bin/sh

TIMEOUT=${TIMEOUT-500}
INTERRUPT=${INTERRUPT-0}
POLL=${POLL-0}

> /dev/null sudo sh <<XXXX
echo $TIMEOUT 	| tee /sys/module/xdma/parameters/c2h_timeout_ms
echo $TIMEOUT 	| tee /sys/module/xdma/parameters/h2c_timeout_ms
echo $POLL 	| tee /sys/module/xdma/parameters/poll_mode
echo $INTERRUPT | tee /sys/module/xdma/parameters/interrupt_mode
XXXX

grep -R . /sys/module/xdma/parameters
