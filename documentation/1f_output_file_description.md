<html><head></head><body>
<h1>Description of Output File</h1>


<p>The format of the output file is as follows:</p>



<table class="tg">
<thead>
  <tr>
    <th class="tg-amwm">Output file sections</th>
    <th class="tg-amwm">Description</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-73oq">Number of Magnetic centres:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6<br>Total number of possible interactions:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;15<br>Input obtained from spin density file<br>..........<br>..........<br>Number of spin density sets:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6<br>Spin Matrix<br>..........<br>...........<br><br></td>
    <td class="tg-73oq">Details of the basic input parameters and <br>the information obtained from the file <br>containing the spin density information <br>are given here.</td>
  </tr>
  <tr>
    <td class="tg-73oq">No. of J value asked for = 2 <br>Interactions considered under each J value <br>J 1 &nbsp;&nbsp;1 2 &nbsp;&nbsp;1 3 &nbsp;&nbsp;1 5 &nbsp;&nbsp;1 6 &nbsp;&nbsp;2 3 &nbsp;&nbsp;2 4&nbsp;&nbsp;&nbsp;2 6&nbsp;&nbsp;&nbsp;3 4 <br>3 5&nbsp;&nbsp;&nbsp;4 5&nbsp;&nbsp;&nbsp;4 6&nbsp;&nbsp;&nbsp;5 6  <br>J 2&nbsp;&nbsp;&nbsp;1 4&nbsp;&nbsp;&nbsp;3 6&nbsp;&nbsp;&nbsp;2 5 <br>Coefficients of J values<br>.........<br>.........<br>.........<br><br></td>
    <td class="tg-73oq">The interactions accounted for by each <br>J-value are provided here. The <br>coefficients associated with each J-value <br>based on the Hamiltonian are also given.</td>
  </tr>
  <tr>
    <td class="tg-73oq">Possible combination of equations per set of equations <br>considered (i.e. total number of equations -1): <br>5 C&nbsp;&nbsp;&nbsp;2 =     10<br>Solving the equations <br>Average J values<br>Ref. eq.&nbsp;&nbsp;&nbsp; non-singular solutions&nbsp;&nbsp;&nbsp; J 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; J 2 
	<br>1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-3.4459&nbsp;&nbsp;&nbsp;-1.2797 
	<br>2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-3.4757&nbsp;&nbsp;&nbsp;-1.2704<br>.........<br>.........<br>.........<br><br></td>
    <td class="tg-73oq">The total possible combinations after using <br>one of the equations as a reference is <br>mentioned here. This is followed by the details<br>of the average J-values obtained for each <br>set with each set differing in the equation <br>used as a reference.</td>
  </tr>
  <tr>
    <td class="tg-73oq">Removing solutions in which J-values deviate by more <br>than 3 standard deviations <br>Standard deviation (percentage standard deviation) <br>on different J-values:<br>non-singular equations&nbsp;&nbsp;&nbsp;J 1&nbsp;&nbsp;&nbsp;J 2<br>.........<br>........<br><br></td>
    <td class="tg-73oq">Information on standard deviations for each <br>J-values when cycling through all valid <br>solutions to ensure that each of them is <br>within 3 standard deviations is given here.</td>
  </tr>
  <tr>
    <td class="tg-73oq">Final results <br>Total non-singular equations&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;60 <br>Average J-values (cm-1) and standard deviations <br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;J 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;J 2 
	<br>J-val&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.4803&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.2787 <br>Std. Dev.     0.05( 1%)          0.04( 3%)<br><br></td>
    <td class="tg-73oq">Summary of results.</td>
  </tr>
  <tr>
    <td class="tg-73oq">Comparison of energy (cm-1) of electronic states <br>calculated by DFT <br>and energy obtained using the average J-values <br>calculated:<br>(Note: The following are the energies assuming the first <br>energy value in the spin density file as the reference value) <br>DFT Energy(cm-1)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Calculated energy(cm-1)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Absolute Difference(cm-1) <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.00000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.00000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.00000( NaN%)<br>........<br>........<br>........<br></td>
    <td class="tg-73oq">A comparison between the energy of the different <br>states calculated using DFT and that calculated <br>using the J-values is provided in this section. <br>This can be used to check how well the coupling <br>constants describe the different states. <br>Large differences between the two energy <br>values indicate problems in either the modelled <br>states or the Hamiltonian used.</td>
  </tr>
</tbody>
</table>




 

<p></p>




    
</body></html>
