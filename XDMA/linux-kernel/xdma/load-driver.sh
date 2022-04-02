#!/bin/sh -x

DEBUG=1 make && {
	sudo rmmod xdma
	sudo insmod xdma.ko
	echo "
==== Parameters"
	grep -R . /sys/module/xdma/parameters
}

