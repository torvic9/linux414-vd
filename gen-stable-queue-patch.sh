#!/bin/bash
#source ${srcdir}/PKGBUILD
_basekernel=4.14
_ser=1

if [ -d stable-queue ] ;
then
  cd stable-queue
  git pull
  cd ..
else
  git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git
  echo "cloned stable queue!" && sleep 1
fi

if [ -d stable-queue/queue-$_basekernel ] ;
then
  cd stable-queue/queue-$_basekernel
  pwd

  for i in $(cat ./series); 
  do 
     cat $i >> ../../../prepatch-$_basekernel-$_ser; 
  done
  echo "created prepatch file!" && sleep 1
else
  echo "There is no patch-set this time"
fi
