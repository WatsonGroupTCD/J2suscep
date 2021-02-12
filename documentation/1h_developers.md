<html><head></head><body>
<h1>For Developers</h1>
<h2>Workflow</h2>
<p>The ej_calc code, is divided into 4 modules:</p>
<p>1.	main.F90: controls the flow of the code.</p>
<p>2.	init.F90: declares all the global variables, reads the input files and initializes the global variable using the information obtained from the input files.</p>
<p>3.	modul_lib.F90: builds up the Hamiltonian based on the definition obtained from the input file. It further forms different combinations of the equations and solves them using LAPACK routines. The average of all the valid sets of j-values and the standard deviations for each J-value is also determined using this module.</p>
<p>4.	enrg_frm_jval.F90: calculates the energy of the all spin states using the Heisenberg Dirac van Vleck Hamiltonian (H&#770 = -2 &sum;<sub>i>j</sub> J<sub>ij</sub>s<sub>i</sub>s<sub>j</sub>).
<font face="Arial, Helvetica, sans-serif" size="-2">[<a href="refs#Heisenberg" class="showTip Heisenberg">Heisenberg</a>], [<a href="refs#Dirac" 
class="showTip Dirac">Dirac</a>], [<a href="refs#Vanvleck" class="showTip Vanvleck">Vanvleck</a>]</font>  </p> 
<br>

<p>A detailed breakdown of each module is provided below.</p>

<h3>init.F90</h3>
<p>This module defines all the global variables.</p>

<table class="tg">
<thead>
  <tr>
    <th class="tg-amwm"> Variable </th>
    <th class="tg-amwm"> Function </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0lax"> num_mag_cent </td>
    <td class="tg-0lax"> stores the number of metal centres in each configuration. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> no_of_j_val </td>
    <td class="tg-0lax"> stores the total number of j-values defined for the system. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> tot_interac </td>
    <td class="tg-0lax"> stores the number of possible interactions between spins i.e. the total number of S1S2 terms. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> num_spin_dens_set </td>
    <td class="tg-0lax"> stores the number of sets of spin density available which is the total number of lines in the spin density file. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> try &nbsp;</td>
    <td class="tg-0lax"> this helps in keeping the program running just in case there is an equation set is encountered that cannot be solved. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> poss_comb </td>
    <td class="tg-0lax"> stores the possible combination of equations i.e. the <sup>(n-1)</sup>C<sub>j</sub> term. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> main_cntr </td>
    <td class="tg-0lax"> keep track of total non-singular equations.</td>
  </tr>
  <tr>
    <td class="tg-0lax"> start, finish </td>
    <td class="tg-0lax"> These in combination determine the time taken during the program execution.</td>
  </tr>
</tbody>
</table>
<br>


<table class="tg">
<thead>
  <tr>
    <th class="tg-amwm"> Array </th>
    <th class="tg-amwm"> Function </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0lax"> hamil1, hamil2 </td>
    <td class="tg-0lax"> These in combination keep track of which centres are interacting . </td>
  </tr>
  <tr>
    <td class="tg-0lax"> jpos </td>
    <td class="tg-0lax"> keeps track of how many interactions are being included under a single j-value. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> energy </td>
    <td class="tg-0lax"> stores the energy for each electronic configuration. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> tot_avg </td>
    <td class="tg-0lax"> stores the average of all the J-value sets which are valid and which meet the standard deviation criteria. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> stddev </td>
    <td class="tg-0lax"> stores the standard deviation for the different J-values. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> std_per </td>
    <td class="tg-0lax"> stores the percentage standard deviation for the different J-values. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> spin </td>
    <td class="tg-0lax"> stores the spin operator value associated with each metal centre as given in the spin operator file. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> hamil </td>
    <td class="tg-0lax"> stores the 2S1S2 type weight terms for each interaction. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> jval </td>
    <td class="tg-0lax"> stores the total (2S1S2 type) coefficient associated with each j-value. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> jval_trkr </td>
    <td class="tg-0lax"> stores all the computed sets of j-values. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> singul </td>
    <td class="tg-0lax">   (for ej_calc_spin only) stores the location of singular sets of equations identified by ej_calc_form. It essentially stores the data in the file singul.      </td>
  </tr>
</tbody>
</table>
<br>
<br>

<h3>modul_lib.F90</h3>
<p>This module contains all the subroutines required to calculate all the possible sets of j-values and determine the valid ones based on standard deviation. 
The following subroutines form part of this module:</p>
<p><b>1.	jvals:</b> This subroutine will determine the S1S2 terms and which of these terms comes under a given j-value.</p>
<p><b>2.	solv:</b> This subroutine forms all possible sets of equations and solves them. The local variables used in this subroutine are as follows:</p>

<table class="tg">
<thead>
  <tr>
    <th class="tg-amwm"> Array </th>
    <th class="tg-amwm"> Function </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0lax"> ctr </td>
    <td class="tg-0lax"> allows the separation and hence the evaluation of all possible combinations. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> loc_energy </td>
    <td class="tg-0lax"> stores the energy locally since that will be changed in each set of equations considered. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> enrg_tb_slvd1 </td>
    <td class="tg-0lax"> local copy of the global array ‘energy’. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> enrg_tb_slvd </td>
    <td class="tg-0lax"> stores the energy of the set of equations that will be solved in one instance. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> enrg_tb_slvd2 </td>
    <td class="tg-0lax"> (for ej_calc_form only) copy of the array ‘enrg_tb_slvd’. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> loc_jval </td>
    <td class="tg-0lax"> store the coefficients of j-values locally since that will be changed in each set of equations considered. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> jval_tb_solvd1 </td>
    <td class="tg-0lax"> local copy of the global array ‘jval’. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> jval_tb_solvd </td>
    <td class="tg-0lax"> stores the coefficients of j-values of the set of equations that will be solved in one instance. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> jval_tb_solvd2 </td>
    <td class="tg-0lax"> (for ej_calc_form only) copy of the array ‘jval_tb_solvd’. </td>
  </tr>
</tbody>
</table>
<br>

<p>In this subroutine, first of all, an electronic state is chosen as the reference state (every state is chosen as a reference state once) and a new set 
of equations is formed by subtracting the reference state from all the other states. These states are then grouped into all possible sets of r (the number 
of j-values one is looking for) and each such set is solved as simultaneous linear equations using the LAPACK library routine dgesv. The LAPACK routine 
dgesv is implemented in a different subroutine called simul_solv which also performs a few basic checks for singularity. If the solution is found to be 
singular, the value of all j-values for the given set is set to zero. If, however, the set is not found to be singular, a more thorough screening of the 
set is performed using the LAPACK library routine dgesvx which is implemented in the subroutine simul_solv1. Additionally, if any of the j-value is found to be larger than 50 cm<sup>-1</sup> for a given set of equations, details about the set and the corresponding J-values obtained are printed in the file bigg. In case of ej_calc_spin however, only those sets that are determined as non-singular by the array singul (generated from the 'singul' file created by executing ej_calc_formal) are solved.</p>
<br>


<p><b>3.	checkpos:</b> This subroutine is a helper subroutine for the subroutine ‘solv’ to cycle through all the possible combinations of r (the number of 
j-values one is looking for) spin states from n (or more accurately n-1) spin states. </p>
<p><b>4.	simul_solv:</b> This subroutine is also a helper subroutine for the subroutine ‘solv’. It checks if there are any identical pair of equations which will 
automatically make the whole set singular. If such pairs are not found, then a solution is calculated using the LAPACK library routine dgesv.</p>
<p><b>5.	simul_solv1:</b> (for ej_calc_form only) This subroutine is also a helper subroutine for the subroutine ‘solv’. It calculates the solution for the same set of equations that were considered solvable by simul_solv using the LAPACK library routine dgesvx which looks further for sets of equations close to singularity. The reason why this is used only for the sets which are found to be solvable by dgesv because it is more computationally expensive (The speed gain in keeping simul_solv and simul_solv1 has not 
been determined and considering that this code can still solve ~1,000,000 sets of equations within minutes, it was not considered worth doing). </p>
<p><b>6.	soln_chk:</b> (for ej_calc_form only) This subroutine makes sure that the code does not get stuck on any set of equations. </p>
<p><b>7.	avrg_calcs:</b> This subroutine calculates the average of all the valid set of solutions. </p>
<p><b>8.	std_dev:</b> This subroutine calculates the standard deviation for all the valid set of solutions. </p>
<p><b>9.	std_dev1:</b> This subroutine checks if all the valid j-value sets are within 3 standard deviations or not and if they are not, they are removed. </p>
<p><b>10.	avrg_calcs1:</b> This subroutine will calculate the new average for j-values since some have been eliminated by the subroutine ‘std_dev1’.  </p>
<p><b>11.	final_print:</b> This subroutine prints the final set of J-values. </p>
<p><b>12.	backtrack1:</b> This subroutine will calculate the energies using the computed J-values and compares them with the energies that are provided as input.</p>
<br>
<br>


<h3>enrg_frm_jval.F90</h3>
<p>This module calculates the energy of the spin states using the coupling constants calculated by modul_lib.F90. 
The main local variables used in this module are as follows:</p>

<table class="tg">
<thead>
  <tr>
    <th class="tg-amwm"> Array </th>
    <th class="tg-amwm"> Function </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0lax"> unp_elec </td>
    <td class="tg-0lax"> stores the spin operator value for each metal centre. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> all_config </td>
    <td class="tg-0lax"> stores all the possible spin configurations of spin states. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> new_nrg </td>
    <td class="tg-0lax"> stores the energy of all possible spin states. </td>
  </tr>
  <tr>
    <td class="tg-amwm"> Variable </td>
    <td class="tg-amwm"> Function </td>
  </tr>
  <tr>
    <td class="tg-0lax"> poss_comb1 </td>
    <td class="tg-0lax"> stores the total possible spin states. </td>
  </tr>
</tbody>
</table>
<br>

<p>The following subroutines form part of this module:</p>
<p><b>1.	avg_spin:</b> This subroutine calculates the average spin operator (in this case, the formal spin) value for each metal centre. </p>
<p><b>2.	all_poss_spins:</b> This subroutine along with the subroutine ‘update_spin’ forms all possible spin configurations, stores them in the array 
‘all_config’, determines the energy of each configuration in accordance with the specified hamiltonian and stores the energy in the array ‘new_nrg’. </p>
<p><b>3.	sort:</b> This subroutine sorts all the spin states on the basis of increasing energy using bubble sort. </p>
<p><b>4.	swap:</b> This is a helper subroutine for the subroutine ‘sort’. </p>
<p><b>5.	prnt:</b> This subroutine prints the sorted energies in the nrg_frm_jval file. </p>
<p><b>6.	update_spin:</b> This is a helper subroutine for the subroutine ‘all_poss_spins’ for cycling through all possible spin configurations.</p>
<p><b>7.	std_dev2d:</b> (for ej_calc_spin only) calculates the standard deviation for the spin operator values that are used to calculate the energy of all spin states.</p>
<br>
<br>

    
</body></html>
