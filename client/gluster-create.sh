#!/bin/bash

trap 'service glusterd stop; exit 0' TERM

service glusterd start
sleep 1
gluster peer probe gluster-srv1
sleep 1
gluster peer probe gluster-srv2
sleep 1

gluster vol create gluster-testvol replica 2 transport tcp gluster-srv1:/vol1 gluster-srv2:/vol2 force
gluster vol start gluster-testvol

gluster peer status
gluster pool list

mkdir /sample
mount -t glusterfs gluster-srv1:gluster-testvol /sample
touch /sample/testfile1 /sample/testfile2 /sample/testfile3 /sample/testfile4

exec /bin/bash
