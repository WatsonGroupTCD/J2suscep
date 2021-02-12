<html><head></head><body>
<h1>For Users</h1>



<p>The execution of the code needs to be done in two steps.</p>
<br>
<p>(i)	The first step is to execute ej_calc_form. If the input files are file1 and file2, then the following command can be used: </p>
<pre>./ej_calc_form file 1 file 2</pre>
<p>It is necessary to run ej_calc_form to produce the singul file which is required to calculate the coupling constant using ej_calc.</p>


<br>
<p>(ii)	This is followed by the execution of ej_calc_spin as:</p>
<pre>./ej_calc_spin file 1 file 2</pre>
<br>


<p>file 1 is the file containing the definition of the Hamiltonian.</p>
<p>file 2 is the file containing the value of spin operators for each paramagnetic centre and the energy of different spin states.</p>
<p>The details about the coupling constants are printed in the files file 1_form.out and file 1.out for ej_calc_form and ej_calc_spin respectively.</p>
<p>For ease, a bash script (ej_calc) has also been provided in the bin directory that can be used to execute both codes together. The execution is carried out in a manner similar to that used for each ej_calc_form and ej_calc_spin:
</p>
<pre>./ej_calc file 1 file 2</pre>
<p>The details of the format for file 1 and file 2 and an example of each are provided in the following discussion.</p>
<p></p>


<br>
<h2>Format of File 1 </h2>
<p>The format of this file is as follows:</p>

<pre>
magnetic centres
&lt;number of paramagnetic centres&gt;
J values
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
<p><b>Note:</b> The terms ‘magnetic centres’, ‘J-values’, ‘Hamiltonian’ and ‘Hamiltonian Ends’ are case-sensitive.</p>


<br>
<h2>Format of File 2</h2>
<p>The format of this file is as follows:</p>

<pre> 
&lt;S<sub>11</sub>&gt;  &lt;S<sub>12</sub>&gt;  &lt;S<sub>13</sub>&gt; ………. &lt;E<sub>1</sub>&gt;
&lt;S<sub>21</sub>&gt;  &lt;S<sub>22</sub>&gt;  &lt;S<sub>23</sub>&gt; ………. &lt;E<sub>2</sub>&gt;
&lt;S<sub>31</sub>&gt; &lt;S<sub>32</sub>&gt; &lt;S<sub>33</sub>&gt; ………. &lt;E<sub>3</sub>&gt;
…..
….

</pre>

<p>Here &lt;S<sub>ij</sub>&gt; denotes the spin operator value for the j<sup>th</sup> paramagnetic centre in the i<sup>th</sup> electronic state and &lt;E<sub>i</sub>&gt; represents the energy of the i<sup>th</sup> state in <b>Hartrees</b>.</p>


<p></p>




    
</body></html>
