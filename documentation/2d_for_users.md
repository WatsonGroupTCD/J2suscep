<html><head></head><body>
<h1>For Users</h1>



<p>The execution of the code (for an input file called file) is done as follows:</p>
<pre>./suscep file</pre>

<p>The details of the format for the input file are given below:</p>


<br>
<h2>Format of Input File</h2>
<p>The format of this file is as follows:</p>

<pre>
magnetic centres
&lt;number of paramagnetic centres&gt;
spin
&lt;spin on the first paramagnetic centre&gt;
&lt;spin on the second paramagnetic centre&gt;
&lt;spin on the third paramagnetic centre&gt;
And so on
No. of J values
&lt;number of J-values&gt;
J-values
&lt;1st J-value (in cm-1)&gt;
&lt;2nd J-value (in cm-1)&gt;
&lt;3rd J-value (in cm-1)&gt;
And so on
g value
&lt;g value&gt;
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
Field Strength
&lt;Field Strength (in Oersted)&gt;
</pre>


<p>This is the format of the input file. The first line has to state 'magnetic centres' and the second line will specify how many 
magnetic centres are there. Then the spin (number of unpaired electrons/2) on each paramagnetic centre is specified. The line 
containing ‘No. of J values’ is followed by the strength of each J-value (in cm<sup>-1</sup>) specified on separate lines. This is followed 
by the definition of the g value which is then followed by the definition of the Hamiltonian. The final term is the strength of 
the applied field (in Oersted).</p>

<p><b>Note:</b> The terms ‘magnetic centres’, ‘spin’, ‘No. of J values’, ‘J-values’, ‘g value’, ‘Hamiltonian’ and ‘Field Strength’ are case-sensitive.</p>


<p></p>




    
</body></html>
