#!/bin/sh

BASE=${BASE-/recorder/common}
WHAT=${WHAT-dma_ip_drivers}
DEST=${DEST-$BASE}

WHEN=$( date "+%Y-%m-%d-%H-%M-%S" )
INTO=$DEST/$WHEN-$WHAT.tar.gz

BASE=$BASE/sources

echo "
==== Parameters
BASE : $BASE
WHAT : $WHAT
DEST : $DEST

WHEN : $WHEN
INTO : $INTO
"

cd $BASE || {
    echo "ERROR cannot use: $BASE"
    exit 1
}

tar -cva --exclude='build/**' -f $INTO $WHAT || {
    echo "ERROR cannot generate: $INTO"
    exit 1
}

echo "
Captured : $BASE/$WHAT 
    into : $INTO
"
