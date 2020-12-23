#####################################################
# awk script to examine two ej_calc_spin files and determine the code is running correctly 

   BEGIN {
      data=1 
      tol = 0.0001
   }
    
#####################################################
# function for absolute value 

   function abs(num) {
      return num < 0 ? -v : v
   }


#####################################################
# function to do a numerical check to the level of tol 

   function check(num) {
      if (abs(num) <= tol ) check_result = 1
      if (abs(num) >  tol ) check_result = 0     
      return check_result
   }

#####################################################
# second file set data=2 shift data in arrays 
   FNR!=NR {
      data=2
   } 

#####################################################
# test the programs used were the same 

   NF==3 && $1=="*" && $3="*" {
      program[data]=$2
#      print "program = ", program[1], program[2]
      
      if(data==2) {
         if (program[1]==program[2] ) {
            print "    PASS - Running matching programs ", program[1] 
         }
         else {
            print "    FAIL - Output from running difference programs", program[1], program[2]
            FAIL = 1 
         }
      }
   }   
 

#####################################################
# test number of magnetic centres

   NF==5 && $1=="Number" && $2=="of" && $3="magentic" {
      num_mag[data]=$5
#      print "num_mag = ",num_mag [1], num_mag[2]
      if(data==2) {
         if (num_mag[1]==num_mag[2] ) {
            print "    PASS - matching number of magnetic atoms", num_mag[1] 
         }
         else {
            print "    FAIL - detecting different number of magnetic atoms ", num_mag[1], num_mag[2]
            FAIL = 1 
         }
      }
   }

#####################################################
# complicated way to extract the lines containing the spin quantum numbers  1 lines for each magnetic atom 

   read_sets>0 && read_sets<=num_mag[data] {
      for (i=1;i<=NF;i++) {
         sets_spin[data,read_sets,i]= $i 
      }

#      for (i=1;i<=NF;i++) 
#         printf ("%12.8G ", sets_spin[data,read_sets,i])
#      printf "\n"

      if (data==2) {
         pass = 0 
         for (i=1;i<=NF;i++) {
            if (check(sets_spin[1,read_sets,i] - sets_spin[2,read_sets,i])) {
               pass++      
#            print " pass= ", pass , sets_spin[1,read_sets,i], sets_spin[2,read_sets,i]
            }
         }
         if (pass==NF){
            print "    PASS - magnetic spin quantum number for centre ",read_sets
         } 
         else {
            print "    FAIL - Output has different spin data for spin qunatum number for centre ", read_sets
            FAIL = 1 
         }
      }  

      read_sets++
      if(read_sets>num_mag[data]) 
          read_sets=0
   }

#####################################################
# set read_sets=1 once header for Magnetic Spin Quantum has been read 

   NF==6 &&  $1=="Magnetic" && $2=="Spin" && num_mag[data]>0 {
      read_sets = 1  
   } 

#####################################################
# number of J values 
#
#   NF == 8 && $1=="No." && $2=="of"  {
#      num_J[data]=$8
#   }

#####################################################
# read final J values (after locating) 
   
#   read_final_J>0 {
##      print " test ", read_final_J  
#      for (i=2;i<=NF;i++) {
#         sets_final_J[data,i-2]= $i 
#      }
#
##      for (i=1;i<=num_J[data];i++) 
##         printf ("%12.8G ", sets_final_J[data,i])
##      printf "\n"
#
#      if (data==2) {
#         pass = 0 
#         for (i=1;i<=num_J[1];i++) {
#            if (sets_final_J[1,i]== sets_final_J[2,i]) {
#               pass++      
##            print " pass= ", pass , sets_final_J[1,i], sets_final_J[2,i]
#            }
#         }
#         if (pass==num_J[1]){
#            print "    PASS - final J values match  " 
#         } 
#         else {
#            print "    FAIL - Output has different final J values "
#            FAIL = 1 
#         }
#      }
#
#
#      read_final_J=0
#      loc_final_J=0
#   }

#####################################################
# found final J value 
#
#   loc_final_J>0 && $1 == "J"  && $2 == "1" {
#      read_final_J=1 
#   }
#
## two lines from final J values 
#   $1 == "Average" && $2 == "J-values" && "(cm-1)"  {
#      loc_final_J=1
#
#   }
# 

#####################################################
# print error if fail set to 1 

   END {
      if (FAIL==1) {
         print " "
         print " TEST FAILLED - see above "
         print " "
         exit 1 
      }
      else {
         print " "
         print " TEST PASSED  "
         print " "
         exit 0 
      }
   }
