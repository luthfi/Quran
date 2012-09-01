#!/bin/bash

#include data
. ./daftarsurat.sh

line=${1}
linesum=0
cursurah=1
let sumcursurah=s[${cursurah}]
curayah=0
counter=1
until [ ${counter} -gt ${line} ]; do
    let curayah+=1
    let counter+=1
    if [ ${curayah} -gt ${sumcursurah} ]; then
	curayah=1
	let cursurah+=1
	let sumcursurah=s[${cursurah}]
    fi

done
#if [ ${curayah} -gt
#let curayah-=1
echo "${cursurah}:${curayah}"