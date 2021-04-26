<html><head></head><body>
<h1>For Developers</h1>

<p>The key global variables in this code are defined below:</p>

<table class="tg">
<thead>
  <tr>
    <th class="tg-amwm">  Variable </th>
    <th class="tg-amwm">  Function </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0lax"> dimension </td>
    <td class="tg-0lax"> stores the number of magnetic centres. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> no_of_j_val </td>
    <td class="tg-0lax"> stores the total number of unique J-values defined for the Hamiltonian. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> totalspin </td>
    <td class="tg-0lax"> stores the row (or column) size of the spin hamiltonian matrix. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> spin_mat_col </td>
    <td class="tg-0lax"> stores the column size of the spin matrix. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> j_mat_col </td>
    <td class="tg-0lax"> stores the column size of the J value matrix. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> spin </td>
    <td class="tg-0lax"> stores the S value (i.e. total number of unpaired e<sup>-</sup>/2) for each metal centre. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> jval </td>
    <td class="tg-0lax"> stores the different J-values in use. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> jmatx, jmaty </td>
    <td class="tg-0lax"> store information about which J-values are associated with different spin pairs. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> hamil </td>
    <td class="tg-0lax"> stores the spin hamiltonian matrix. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> g </td>
    <td class="tg-0lax"> stores the (isotropic) g-value </td>
  </tr>
  <tr>
    <td class="tg-0lax"> B </td>
    <td class="tg-0lax"> stores the magnetic induction in Wb m<sup>-2</sup>. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> vac_perm </td>
    <td class="tg-0lax"> stores the strength of the applied field. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> field_str </td>
    <td class="tg-0lax"> permeability of free space in vacuum. </td>
  </tr>
  <tr>
  <tr>
    <td class="tg-0lax"> init_temp </td>
    <td class="tg-0lax"> stores the minimum temperature for the susceptibility measurement. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> fin_temp </td>
    <td class="tg-0lax"> stores the maximum temperature for the susceptibility measurement. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> step_size </td>
    <td class="tg-0lax"> stores the step size for temperature increments. </td>
  </tr>
    <td class="tg-0lax"> spinmat </td>
    <td class="tg-0lax"> stores all possible M<sub>s</sub> values for each metal centre. </td>
  </tr>
  <tr>
    <td class="tg-0lax"> basis </td>
    <td class="tg-0lax"> stores all possible combinations of M<sub>s</sub> values of all metal centres. </td>
  </tr>
</tbody>
</table>
<br>

<p><b>1.	Init:</b> This subroutine reads in the input file and initialises the global variables.</p>
<p><b>2.	Printer:</b> This subroutine prints some basic details to the output file.</p>
<p><b>3.	SpinMatForm:</b> This subroutine determines the M<sub>s</sub> values for each paramagnetic centre.</p>
<p><b>4.	FormBasis:</b> The subroutine calculates the basis that will be used to span the Hamiltonian matrix. Each basis element comprises of a 
M<sub>s</sub> value for each paramagnetic centre.</p>
<p><b>5.	CheckPos and UpdatePos:</b> These subroutines are helper subroutines for the subroutine ‘FormBasis’ to cycle through all the possible 
combinations of M<sub>s</sub> values for the paramagnetic centres.</p>
<p><b>6.	HamilForm:</b> This subroutine defines the Hamiltonian matrix using the various basis elements and operates each element with the exchange operator.</p>
<p><b>7.	Kron_del:</b> This function is used to determine the value of the kronecker delta function.</p>
<p><b>8.	Diag:</b> This helper subroutine is used for matrix diagonalisation using the LAPACK library.</p>
<p><b>9.	Zeeman:</b> This subroutine adds the Zeeman term to the elements of the Hamiltonian matrix.</p>
<p><b>10.	Suscep_calc:</b> This subroutine defines the B matrix (eq. <a href="2b_theory#twenty_one" class="showTip twenty_one">21</a>), 
calculates the matrix of coefficients (C matrix, eq. <a href="2b_theory#twenty_two" class="showTip twenty_two">22</a>) 
and then calculates the temperature dependence of susceptibility.</p>

<p></p>


    
</body></html>
