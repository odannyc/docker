#!/bin/sh
FLAGS=${1:-"-td"}
NETWORK=${NETWORK:-"kazoo"}
NAME=kamailio.$NETWORK
docker stop -t 1 $NAME
docker rm -f $NAME
docker run $FLAGS \
	--net $NETWORK \
	-h $NAME \
	--name $NAME \
	--env NETWORK=$NETWORK \
	--env RABBITMQ=rabbitmq.$NETWORK \
	--env FREESWITCH=freeswitch.$NETWORK \
	kazoo/kamailio
