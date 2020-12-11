#!/bin/bash
exe=$1
a="example"
b="ex"
c="spin"

# make directory 
mkdir -p $1
cd $1 

# Copy all files to this directory
cp -r ../../$1/example* .

# Running ej_calc
ls -d $a? > list
n=$(cat list | wc -l)
for((i=1; i<($n); i++))
do
	cd $a$i
	echo "Running "$a$i" in "$exe" to calculate coupling constants"
	echo " "
	../../../../bin/$exe  $b$i $c
	cd ..
done
#rm -r $a?/
rm list
cd ../

