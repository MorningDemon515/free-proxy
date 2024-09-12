#!/bin/bash

source ~/.bashrc

basedir=$(dirname "$0")
project_root=$basedir/..
echo $project_root

cd $project_root

git pull
cp -f tpl/readme.tpl.cn.md  README.md
outfile=README.md
lastUpdateDateTime=$(date '+%F %T')
nextUpdateDateTime=$(date -d '+6 hour' '+%F %T')
#nextUpdateDateTime=$(date -d '+1 min' '+%F %T')
echo "" >> $outfile
echo Last updated at $lastUpdateDateTime UTC+8, next update schedule at $nextUpdateDateTime UTC+8 >>  $outfile

git add $outfile
git commit -m "update at $lastUpdateDateTime"
git push 

cd -
