#!/bin/bash
exe=$1
s=$2
f=$3 
a="example"
b="ex"
c="spin"
num_pass=0
num_fail=0 

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
	echo " "
	echo "Running "$a$i" in "$exe
	echo " "
	if [ "$exe" = "ej_calc_form" ]; then
		$exe  $b$i $c
	elif [ "$exe" = "ej_calc_spin" ]; then
		$exe  $b$i $c
	elif [ "$exe" = "suscep" ]; then
		$exe  $b$i "additional_params" "jvals"
	fi

# awk script to compare the results
        if [ "$exe" = "ej_calc_form" ]; then
           awk -f ../../comp_ej_calc.awk $b$i"_form.out" ref_output 
        elif [ "$exe" = "ej_calc_spin" ]; then
           awk -f ../../comp_ej_calc.awk $b$i"_spin.out" ref_output 
        elif [ "$exe" = "suscep" ]; then
           awk -f ../../comp_suscep.awk $b$i".out" ref_output 
        fi 

# check if successful 
        test_result=$?

        if [ $test_result -eq 0 ]; then
#            echo "test "$a$i" passed"
            ((num_pass++))
        elif [ $test_result -eq 1 ]; then
#            echo "test "$a$i" failed"
            ((num_fail++))
        fi

	cd ..
done
#cd ../


total_test=$((num_fail+num_pass))

echo "******************************************************************************"
echo "*  "$exe " : "$total_test" tests run "$num_pass" passed "$num_fail" failed                                   *" 
echo "******************************************************************************"
echo " " 
