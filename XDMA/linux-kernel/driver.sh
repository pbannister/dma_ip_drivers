#!/bin/sh

TIMEOUT=${TIMEOUT-500}
INTERRUPT=${INTERRUPT-0}
POLL=${POLL-0}

for ko in xdma.ko xdma/xdma.ko ; do
    test -e $ko && KO=$ko
done

sudo sh -x <<XXXX
lsmod | grep xdma && rmmod xdma
insmod $KO c2h_timeout_ms=$TIMEOUT h2c_timeout_ms=$TIMEOUT poll_mode=$POLL interrupt_mode=$INTERRUPT
XXXX

grep -R . /sys/module/xdma/parameters
