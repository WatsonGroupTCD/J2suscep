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
            print "     PASS - Running matching programs ", program[1] 
         }
         else {
            print "     FAIL - Output from running difference programs", program[1], program[2]
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
            print "     PASS - matching number of magnetic atoms", num_mag[1] 
         }
         else {
            print "     FAIL - detecting different number of magnetic atoms ", num_mag[1], num_mag[2]
            FAIL = 1 
         }
      }
   }

#####################################################
# complicated way to extract the lines containing the spin and energies for num_sets lines 

   read_sets>0 && read_sets<=num_sets[data] {
      for (i=1;i<NF;i++) {
         sets_spin[data,read_sets,i]= $i 
      }
      sets_energy[data,read_sets]=$(NF) 

#      for (i=1;i<NF;i++) 
#         printf ("%12.8G ", sets_spin[data,read_sets,i])
#      printf ("%12.8G ", sets_energy[data,read_sets] )
#      printf "\n"

      if (data==2) {
         pass = 0 
         for (i=1;i<=num_mag[1];i++) {
#            if (sets_spin[1,read_sets,i]== sets_spin[2,read_sets,i]) {
#            print " check ",  sets_spin[1,read_sets,i], sets_spin[2,read_sets,i]
            if (check(sets_spin[1,read_sets,i] - sets_spin[2,read_sets,i])) {
               pass++      
#            print " pass= ", pass , sets_spin[1,read_sets,i], sets_spin[2,read_sets,i]
            }
         }
         if (pass==num_mag[1]){
            print "     PASS - spin set ",read_sets, " magnetic moments "
         } 
         else {
            print "     FAIL - Output has different spin data for set ", read_sets
            FAIL = 1 
         }
#         if (sets_energy[1,read_sets]==sets_energy[2,read_sets] ) {
         if (check(sets_energy[1,read_sets] - sets_energy[2,read_sets])) {
            print "     PASS - spin set ", read_sets ," energy matches ",sets_energy[1,read_sets] 
         }
         else {
            print "     FAIL - Output has different energies for spin set ",read_sets, "Energy are ",sets_energy [1,read_sets], sets_energy[2,read_sets] 
            FAIL = 1 

         }
      }  

      read_sets++
      if(read_sets>num_sets[data]) 
          read_sets=0
   }

#####################################################
# set num_sets once header has been read 

   NF==2 && $1=="Spin" && $2=="Matrix" && temp_sets>0 {
      num_sets[data]=temp_sets 
      read_sets=1 
#      print "set num_sets", num_sets[data], read_sets 

      if(data==2) {
         if (num_sets[1]==num_sets[2] ) {
            print "     PASS - same number of data sets  ", num_sets[1] 
         }
         else {
            print "     FAIL - different number of data sets detected ", num_sets[1], num_sets[2]
            FAIL = 1 
         }
      }
   }


#####################################################
# store number of configurations 

   NF==6 && $1=="Number" && $2=="of" && $3="spin" {
      temp_sets=$6 
#      print "set temp_sets", temp_sets 
   }
      


#####################################################
# number of J values 

   NF == 8 && $1=="No." && $2=="of"  {
      num_J[data]=$8
   }

#####################################################
# read J inital values (after locating) 
   
   read_J>0 && read_J<=num_sets[data] {
      for (i=3;i<=NF;i++) {
         sets_J[data,read_J,i-2]= $i 
      }

#      for (i=1;i<=num_J[data];i++) 
#         printf ("%12.8G ", sets_J[data,read_J,i])
#      printf "\n"

      if (data==2) {
         pass = 0 
         for (i=1;i<=num_J[1];i++) {
#            print " check ",i,  sets_J[1,read_J,i], sets_J[2,read_J,i]
            if (sets_J[1,read_J,i]== sets_J[2,read_J,i]) {
               pass++      
#            print " pass= ", pass , sets_J[1,read_J,i], sets_J[2,read_J,i]
            }
         }
         if (pass==num_J[1]){
            print "     PASS - inital J values match for set " , read_J    
         } 
         else {
            print "     FAIL - Output has different initial J values "
            FAIL = 1 
         }
      } 

      read_J++
      if(read_J>num_sets[data]) 
          read_J=0
   }

#####################################################
# found J values

   $1 == "Ref." && $2 == "eq." && $3 == "non-singular" {
      read_J=1 
#   print "read_J = ", read_J 
   } 


#####################################################
# read final J values (after locating) 
   
   read_final_J>0 {
#      print " test ", read_final_J  
      for (i=2;i<=NF;i++) {
         sets_final_J[data,i-2]= $i 
      }

#      for (i=1;i<=num_J[data];i++) 
#         printf ("%12.8G ", sets_final_J[data,i])
#      printf "\n"

      if (data==2) {
         pass = 0 
         for (i=1;i<=num_J[1];i++) {
            if (sets_final_J[1,i]== sets_final_J[2,i]) {
               pass++      
#            print " pass= ", pass , sets_final_J[1,i], sets_final_J[2,i]
            }
         }
         if (pass==num_J[1]){
            print "     PASS - final J values match  " 
         } 
         else {
            print "     FAIL - Output has different final J values "
            FAIL = 1 
         }
      }


      read_final_J=0
      loc_final_J=0
   }

#####################################################
# found final J value 

   loc_final_J>0 && $1 == "J"  && $2 == "1" {
      read_final_J=1 
   }

# two lines from final J values 
   $1 == "Average" && $2 == "J-values" && "(cm-1)"  {
      loc_final_J=1

   }
 

#####################################################
# print error if fail set to 1 

   END {
      if (FAIL==1) {
         print " "
         print " TEST FAILLED - see above "
         print " "
      }
      else {
         print " "
         print " TEST PASSED  "
         print " "
      }
   }
