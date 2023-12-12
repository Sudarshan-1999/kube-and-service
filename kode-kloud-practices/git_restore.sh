#!/bin/bash 


set -xe
for i in $(cat git_restore.txt)
do 
    tar -Af ../ptg_race_yp.tar.xz ${i}
    echo file added
    tar -tvf ../ptg_race_yp.tar.xz | grep ${i}
done