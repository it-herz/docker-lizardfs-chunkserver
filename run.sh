#!/bin/bash

mnts=$( echo $MOUNTS | tr ";" "\n" )
cp /etc/mfs/mfshdd.cfg.dist /etc/mfs/mfshdd.cfg
mkdir -p /var/lib/mfs
chown mfs:mfs -R /var/lib/mfs

for mnt in $mnts
do
  echo Add mount $mnt
  echo $mnt >> /etc/mfs/mfshdd.cfg
  chown mfs:mfs $mnt
done

mfschunkserver -d start
