#!/bin/bash

PORTS=$(echo -n ${SOCAT_PORTS})
for i in ${PORTS//,/ }
do
  echo Forward $i to ${SOCAT_DEST_IP}:$i
  socat TCP4-LISTEN:$i,reuseaddr,fork TCP4:${SOCAT_DEST_IP}:$i &
  socat UDP4-LISTEN:$i,reuseaddr,fork UDP4:${SOCAT_DEST_IP}:$i &
done