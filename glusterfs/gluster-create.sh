#!/bin/bash

trap 'service glusterd stop; exit 0' TERM

service glusterd start
sleep 1
gluster peer probe gluster-server1
sleep 1
gluster peer probe gluster-server2
sleep 1

gluster vol create gluster-testvol replica 2 transport tcp gluster-server1:/gluster-volume1 gluster-server2:/gluster-volume2 force
gluster vol start gluster-testvol

gluster peer status
gluster pool list

exec /bin/bash
