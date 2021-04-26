<html><head></head><body>
<h1>Code execution for ej_calc</h1>

<p>The execution needs to be done in two steps.</p>
<br>
<p>(i)	The first step is to execute ej_calc_form. If the input files are File1 and File2, then the following command can be used:: </p>
<pre>ej_calc_form File1 File2</pre>
<p>It is necessary to run ej_calc_form to produce the singul file which is required to calculate the coupling constant using ej_calc_spin.</p>

<br>
<p>(ii)	This is followed by the execution of ej_calc_spin as:</p>
<pre>ej_calc_spin File1 File2</pre>
<br>

<p>File1 is the file containing the definition of the Hamiltonian.</p>
<p>File2 is the file containing the value of spin operators for each paramagnetic centre and the energy of different spin states.</p>
<p>The details about the coupling constants are printed in the files File1_form.out and File1_spin.out for formal spins and spin densities respectively.</p>


<h3>Alternative code execution</h3>
<p>For ease, a bash script (j2suscep) has also provided in the bin directory that can be used to execute the codes. If the input files are File1 and File2, then the code ej_calc_form can be executed as follows:
</p>
<pre>j2suscep -f File1 File2</pre>
<p>The code ej_calc_spin can be executed as follows:</p>
<pre>j2suscep -s File1 File2</pre>
<p>The use of the '-s' tag leads to the execution of either ej_calc_spin (if a 'singul' file exists in the working directory), or both ej_calc_form and ej_calc_spin (if a 'singul' file does not exist in the working directory). Therefore, if one is only interested in J-values based on spin densities, the '-s' tag will suffice and there is no need to use the '-f' tag.</p>





<p>The details of the format for File1 and File2 are provided in the following discussion.</p>
<p></p>


<br>
<h2>Format of File1 </h2>
<p>The format of this file is as follows:</p>

<pre>
magnetic centres
&lt;number of paramagnetic centres&gt;
No. of J values
&lt;number of j-value>
Hamiltonian
&lt;First interaction associated with the first j-value&gt;
&lt;Second interaction associated with the first j-value&gt;
&lt;Third interaction associated with the first j-value&gt;
And so on
****
&lt;First interaction associated with the second j-value&gt;
&lt;Second interaction associated with the second j-value&gt;
&lt;Third interaction associated with the first j-value&gt;
And so on
****
&lt;First interaction associated with the third j-value&gt;
&lt;Second interaction associated with the third j-value&gt;
&lt;Third interaction associated with the first j-value&gt;
And so on
Hamiltonian Ends

</pre>


<p>The first line has to state 'magnetic centres' and the second line will specify how many magnetic centres are there. 
Then the number of J-values are specified. After that the Hamiltonian is specified.</p>
<p>The spin interactions under a single J-value are specified in a single block. 
The spin interactions for different J-values are separated by '****'. The line 'Hamiltonian Ends' is needed in the end and is not preceded by '****'.</p>
<p><b>Note:</b> The terms ‘magnetic centres’, ‘No. of J values’, ‘Hamiltonian’ and ‘Hamiltonian Ends’ are case-sensitive.</p>


<br>
<h2>Format of File2</h2>
<p>The format of this file is as follows:</p>

<pre> 
&lt;S<sub>11</sub>&gt;  &lt;S<sub>12</sub>&gt;  &lt;S<sub>13</sub>&gt; ………. &lt;E<sub>1</sub>&gt;
&lt;S<sub>21</sub>&gt;  &lt;S<sub>22</sub>&gt;  &lt;S<sub>23</sub>&gt; ………. &lt;E<sub>2</sub>&gt;
&lt;S<sub>31</sub>&gt; &lt;S<sub>32</sub>&gt; &lt;S<sub>33</sub>&gt; ………. &lt;E<sub>3</sub>&gt;
…..
….

</pre>

<p>Here &lt;S<sub>ij</sub>&gt; denotes the spin operator value for the j<sup>th</sup> paramagnetic centre in the i<sup>th</sup> electronic state and &lt;E<sub>i</sub>&gt; represents the energy of the i<sup>th</sup> state in <b>Hartrees</b>.</p>


<p>Examples of input files are provided in the <A HREF="1e_example">Example Input Files</A> subsection under the 'EJ_Calc' section.</p>

<p></p>







<h1>Code execution for suscep</h1>

<p>The execution of the suscep code requires three input files, and for input files named File1, File2 and File3, the suscep code can be executed in either of the following way:</p>
<pre>suscep File1 File2 File3</pre>
<p> or </p>
<pre>j2suscep -S File1 File2 File3</pre>
<p>The details of the format for the input files are given below:</p>


<br>
<h2>Format of File1</h2>
<p>The format of this file is identical to File1 for ej_calc and is described below:</p>

<pre>
magnetic centres
&lt;number of paramagnetic centres&gt;
No. of J values
&lt;number of j-value>
Hamiltonian
&lt;First interaction associated with the first j-value&gt;
&lt;Second interaction associated with the first j-value&gt;
&lt;Third interaction associated with the first j-value&gt;
And so on
****
&lt;First interaction associated with the second j-value&gt;
&lt;Second interaction associated with the second j-value&gt;
&lt;Third interaction associated with the first j-value&gt;
And so on
****
&lt;First interaction associated with the third j-value&gt;
&lt;Second interaction associated with the third j-value&gt;
&lt;Third interaction associated with the first j-value&gt;
And so on
Hamiltonian Ends
</pre>

<p>The first line has to state 'magnetic centres' and the second line will specify how many magnetic centres are there. 
Then the number of J-values are specified. After that the Hamiltonian is specified.</p>
<p>The spin interactions under a single J-value are specified in a single block. 
The spin interactions for different J-values are separated by '****'. The line 'Hamiltonian Ends' is needed in the end and is not preceded by '****'.</p>
<p><b>Note:</b> The terms ‘magnetic centres’, ‘No. of J values’, ‘Hamiltonian’ and ‘Hamiltonian Ends’ are case-sensitive.</p>




<h2>Format of File2</h2>
<p>File2 contains the additional information other than the J-values required to calculate the temperature dependence of magnetic susceptibility and the format is as follows:</p>

<pre>
spin
&lt;spin on the first paramagnetic centre&gt;
&lt;spin on the second paramagnetic centre&gt;
&lt;spin on the third paramagnetic centre&gt;
And so on
g value
&lt;g value&gt;
Field Strength
&lt;Field Strength (in Oersted)&gt;
Temperature range
&lt;Minimum temperature (in Kelvin)&gt;
&lt;Maximum temperature (in Kelvin)&gt;
Step size
&lt;Interval for temperature increments&gt;
</pre>


<p>This is the format of File2. The first line has to state 'spin' and then the spin (number of unpaired electrons/2) on each paramagnetic centre is specified. This is followed by the definition of the g value which is then followed by the field strength (in Oersted) and temperature (in Kelvin). The final term is the step size for temperature (in Kelvin).</p>

<p><b>Note:</b> The terms ‘magnetic centres’, ‘spin’, ‘No. of J values’, ‘g value’, ‘Hamiltonian’, ‘Field Strength’, 'Temperature range' and 'Step size' are case-sensitive.</p>



<h2>Format of File3</h2>
<p>This file contains the magnitude of J-values to be used for the determination of magnetic susceptibility. The format of this file is shown below:</p>
<pre>
J values
&lt;1st J-value (in cm-1)&gt;
&lt;2nd J-value (in cm-1)&gt;
&lt;3rd J-value (in cm-1)&gt;
And so on
</pre>

The first line contains the term ‘J values’ is followed by the strength of each J-value (in cm<sup>-1</sup>) specified on separate lines.
<p><b>Note:</b> The term ‘J values’ is case-sensitive.</p>

<p>Examples of input files are provided in the <A HREF="2e_example">Example Input Files</A> subsection under the 'Suscep' section.</p>
<p></p>



<h1>Combined execution for ej_calc and suscep</h1>
<p>Both the ej_calc and suscep codes can also be executed together. For this, again three files are required:</p>

<blockquote>
<ol>
<li>File1, which contains the details about the Hamiltonian (identical to File1 for both ej_calc and suscep).</li>
<li>File2, which contains information about the the value of spin operators for each paramagnetic centre and the energy of different spin states (identical to File2 for ej_calc).</li>
<li>File3, which contains the additional information other than the J-values required to calculate the temperature dependence of magnetic susceptibility (identical to File2 for suscep).</li>
</ol>
</blockquote>

<p> The execution is performed as follows </p>

<pre>j2suscep -a File1 File2 File3</pre>

<p>The j-values determined using the ej_calc_spin codes are written to a file named 'jvals' and are used for the calculation of the temperature dependence of magnetic susceptibility. </p>

    
</body></html>



    
</body></html>
