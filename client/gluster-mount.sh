#!/bin/bash

sleep 3

mkdir -p /sample
mount -t glusterfs gluster-srv1:gluster-testvol /sample
echo a > /sample/test01
echo b > /sample/test02
echo c > /sample/test03
echo d > /sample/test04

exec /bin/bash