---
title: 'J2suscep: Calculation of magnetic exchange coupling and temperature dependence of magnetic susceptibility'
tags:
  - magnetism
  - ab initio
  - density functional theory
authors:
 - name: Swetanshu Tandon
   orcid: 0000-0002-0626-0626
   affiliation: "1, 2"
 - name: Wolfgang Schmitt
   orcid: 0000-0002-0058-9404
   affiliation: "1, 2"
 - name: Graeme W. Watson
   orcid: 0000-0001-6732-9474
   affiliation: "1"
   email: watsong@tcd.ie
affiliations:
 - name: School of Chemistry & CRANN Institute, University of Dublin, Trinity College, Dublin 2, Ireland
   index: 1
 - name: AMBER Centre, University of Dublin, Trinity College, Dublin 2, Ireland
   index: 2
date: September 2020
bibliography: paper.bib
---

The field of molecular magnetism has attracted significant interest owing 
to the rising need to miniaturize magnets. Advancement in this field 
requires a deep understanding of the electronic structure, and computational 
approaches, in this respect, have played a key role in pushing the limits 
further [@Neese]. A deep understanding of the magnetic properties not 
only helps in making smaller magnets but has also been instrumental in 
speculating the structure of systems that are difficult to crystallise or 
of intermediate states during a catalytic process [@Krewald].

In molecular complexes, the magnetic interaction between paramagnetic 
centres, called the isotropic exchange interaction, has a strong influence 
on the magnetic properties. Within the framework of density functional 
theory (DFT) using what is known as the broken symmetry approach, this 
interaction can be quantified and the coupling strength is called the 
J-value or coupling constant. The broken symmetry approach requires the 
modelling of multiple spin states using DFT but the solution obtained in the 
end can be dependent on the states modelled [@Cremades1; @Cremades2; 
@Rajeshkumar; @Vignesh; @Mn6]. To remove this dependency, more states 
can be modelled but this procedure results in a large number of solutions, 
that have to be averaged in some sensible way. At the moment however, there 
is no convenient way to do so. The purpose of this package is to provide a 
means to accomplish this arduous task. Additionally, for completion, this 
package can also calculate the temperature dependence of magnetic 
susceptibility thereby enabling the comparison of the computational data to 
experiment.


# `J2suscep`

This package essentially contains two standalone codes written in FORTRAN 2008 – 
ej_calc and suscep. Both codes only rely on the LAPACK library [@Lapack]. The 
code ej_calc uses the data obtained from the DFT calculations and determines the 
isotropic exchange coupling between paramagnetic centres. With a completely 
programmable Hamiltonian, this code allows the calculation of any number of 
J-values and is only limited by the number of states modelled. Spin densities 
obtained from any approach can be used for the calculation of J-values. The code 
calculates all possible solutions based on the Hamiltonian and the states modelled, 
removes any singular solutions and calculates an average set of coupling constants 
and the standard deviations. Additionally, it also calculates the energy of the 
different spin states relative to each other using the coupling constants for 
comparison to the original DFT data.

The suscep code calculates the temperature dependence of magnetic susceptibility 
using the coupling constants. Similar to ej_calc, the Hamiltonian is flexible and 
any number of coupling constants can be provided for the calculation of the magnetic 
susceptibility. Although there are other alternatives available to the suscep code 
[@magpack; @phi], the two codes together provide a one stop solution for the 
calculation of coupling constants and the determination of the magnetic susceptibility 
using these coupling constants.

To illustrate the use of this package, we present the example of the {$Mn_6$} complex 
shown in Figure 1 (a) [@Mn6]. Each Mn centre in this complex has 4 cis- and 1 trans- 
neighbours which interact via the Cl- and the phosphonate ligands. One requires 2 J-values 
to account for these cis- and trans- interactions between Mn centres. Modelling of 6 states 
for the calculation of the 2 J-values results in 60 possible solutions and using ej_calc, 
the final values were determined to be -1.28 (cis-coupling) and -3.48 cm^-1^ (trans-coupling) 
respectively [@Mn6]. The use of the suscep code calculates the temperature dependence of 
susceptibility which is shown in Figure 1 (b). This package has been used in a similar manner 
for a {$Mn_8$} complex [@Mn8].

![Figure 1: (a) Structure of the {$Mn_6$} complex and (b) the temperature dependence of magnetic 
susceptibility obtained using the suscep code. Colour scheme: Mn (dark blue), P (pink), Cl (green), 
C (black), N (blue) and O (red). Hydrogen atoms have been removed for clarity.](plot.tif)


# Acknowledgements

The authors are grateful to the Irish research council (GOIPG/2015/2952), Science foundation 
Ireland (12/IA/1414 and 13/IA/1896) and European research council (CoG 2014–647719) for the funding.


# References
