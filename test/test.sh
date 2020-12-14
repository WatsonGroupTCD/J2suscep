#!/bin/bash
exe=$1
s=$2
f=$3 
a="example"
b="ex"
c="spin"

# make directory 
mkdir -p $1
cd $1 

#cp -r ../../examples/$1/example* . 


# Running each example 
for i in `seq $s $f` 
do
# copy example 
        cp -r ../../examples/$1/example$i . 
# go into directory
	cd $a$i
	echo "Running "$a$i" in "$exe
	echo " "
	../../../bin/$exe  $b$i $c
	cd ..
done
#cd ../

