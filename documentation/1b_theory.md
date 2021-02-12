<html><head></head><body>
<h1>Theory</h1>

<p></p>

<p>For obtaining n coupling constants, at least (n+1) spin configurations need to be modelled. 
In principle, for x centres with unpaired electrons, there can be a maximum of x(x-1)/2 coupling constants and a total of 2<sup>x</sup> different spin configurations. 
Out of these 2<sup>x</sup> configurations, half would be the mirror image of the others. 
For example, for any Mn<sub>6</sub><sup>III</sup> system one can have a maximum of (6 X (6-1) / 2 =) 15 coupling constants while the total number of spin 
configurations for this complex are (2<sup>6</sup> =) 64 out of which a maximum of only 32 can be unique. </p>

<p>For any system with more than 3 paramagnetic centres, the number of configurations that are available are more than 
that required to calculate all coupling constants. This can be used to our advantage since we can model more states than required. 
This allows us to remove any dependence of the calculated coupling constants on the states modelled.<font face="Arial, Helvetica, sans-serif" size="-2">[<a href="refs#Cremades" class="showTip Cremades">Cremades</a>], [<a href="refs#Cremades1" class="showTip Cremades">Cremades1</a>], [<a href="refs#Rajeshkumar" class="showTip Rajeshkumar">Rajeshkumar</a>], [<a href="refs#Vignesh" class="showTip Vignesh">Vignesh</a>], [<a href="refs#Tandon" class="showTip Tandon">Tandon</a>]</font>  
However, depending upon the size of the system and the number of states modelled, one can end up with a large number of sets of 
solutions (coupling constants) which have to be averaged in some sensible way. 
This problem has been addressed in this code.</p>


<p>When calculating r coupling constants using n (where n > r) spin configurations, then first of all, one of these configurations has 
to be used as a reference for all the other states so that we can determine the energy only related to the flipping of spin. 
With the remaining (n-1) configurations, a total of [(n-1)!⁄{r!(n-1-r)!}] (i.e. <sup>(n-1)</sup>C<sub>r</sub>) sets of solutions (i.e. r coupling constants) are obtained. 
Since any of the n modelled spin states can be used as a reference, n[(n-1)!⁄{r!(n-1-r)!}] (i.e. n(<sup>(n-1)</sup>C<sub>r</sub>) sets of solutions are obtained.</p>

<p>This code takes the Hamiltonian, the values of spin operators for each paramagnetic centre in each modelled spin state and the energy 
of each modelled spin state as input. This information is then used to calculate the coupling constants. 
As mentioned earlier, when calculating r coupling constants using n (where n > r) spin configurations, a total of n(<sup>(n-1)</sup>C<sub>r</sub>) sets of 
coupling constants are obtained. The sets which turn out to be singular are discarded. The valid solutions are averaged and the standard deviation is calculated. 
The solutions that are deviating by more than three standard deviations are discarded and the standard deviation is calculated again and this cycle is 
repeated until self-consistency is obtained. </p>


<p>The coupling constants obtained this way are then used to further determine the energy of all the possible electronic states (2<sup>0.5x</sup> for 
x paramagnetic centres). To achieve this, the Heisenberg Dirac van Vleck Hamiltonian (H&#770 = -2 &sum;<sub>i>j</sub> J<sub>ij</sub>s<sub>i</sub>s<sub>j</sub>) is used.
<font face="Arial, Helvetica, sans-serif" size="-2">[<a href="refs#Heisenberg" class="showTip Heisenberg">Heisenberg</a>], [<a href="refs#Dirac" 
class="showTip Dirac">Dirac</a>], [<a href="refs#Vanvleck" class="showTip Vanvleck">Vanvleck</a>]</font>  
The spin operator value for each paramagnetic centre is determined by taking an average of the spin operator value in the different electronic states that 
is provided as input. Two electronic states are considered to be degenerate if the difference in the energy between the two is less than 1 cm<sup>-1</sup>.</p>


</body></html>
