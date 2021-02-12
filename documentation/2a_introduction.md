<html><head></head><body>
<h1>Introduction</h1>
<p>Briefly, this code calculates the temperature dependence of magnetic susceptibility for a given system for which the exchange coupling constants have been determined. 
The following Hamiltonian is used to fulfil this purpose:<font face="Arial, Helvetica, sans-serif" size="-2">[<a href="refs#Boca" class="showTip Boca">Boca</a>]</font>  </p> 
<br>

<p align="center"><img src="img/one.jpg" alt="eq. 1"><br /></p>

<p>where <i>J<sub>AB</sub></i> is the coupling constant between the magnetic centres A and B, <i>I</i> and <i>J</i> represent the particular M<sub>s</sub> terms in the basis elements that the 
<i>S&#770<sub>A</sub>.S&#770<sub>B</sub></i> term operates on <i>B&#8407</i> represents the applied magnetic field, g<sub>A</sub> is the gyromagnetic tensor and μ<sub>B</sub> is the unit 
Bohr Magneton. The first term accounts for the exchange coupling between Mn centres and the second term is the Zeeman term.</p>

<p> The basic working of this code involves setting up a matrix of all possible M<sub>S</sub> (the magnetic spin quantum number) states for the given system. 
This is followed by operating each term of this matrix with eq. 1. Once this operation is complete, the matrix is diagonalised to obtain the eigenvalues which 
are then used to determine the magnetic susceptibility at different temperatures using the van Vleck equation. The details of the implementation of this 
procedure are later. </p>

<table border="0" cellpadding="2">
<tr valign="top"><td><p>J<sub>ij</sub></p></td><td>&nbsp;&nbsp;</td>
<td><p>The exchange coupling constant</p></td></tr>
<tr valign="top"><td><p>s<sub>x</sub></p></td><td>&nbsp;&nbsp;</td>
<td><p>The spin operator.</p></td></tr>
</table>
<p> Any definition of spin operators (formal spins or spin projections or spin densities or any other) can be used. Sometimes researchers exclude the pre-factor 
2 in the above formula so this needs to be kept in mind while using this code.</p>

    
</body></html>
