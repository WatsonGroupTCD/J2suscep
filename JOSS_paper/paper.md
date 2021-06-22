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

# `Statement of need`

The field of molecular magnetism has attracted significant interest owing 
to the rising need to miniaturize magnets. Advances in this field 
require a deep understanding of the electronic structure of magnets, and computational 
approaches have played a key role in pushing the limits 
further [@Neese]. A deep understanding of the magnetic properties not 
only helps in making magnets smaller, but has also been instrumental for
reasoning about the structure of systems that are difficult to crystallise, and
about intermediate states during catalytic processes [@Krewald].

In molecular complexes, the magnetic interaction between paramagnetic 
centres, called the isotropic exchange interaction, has a strong influence 
on the magnetic properties. Within the framework of density functional 
theory (DFT), using what is known as the broken symmetry approach, this 
interaction can be quantified; the coupling strength is called the 
*J-value* or coupling constant [@Bsym; @Bsym1]. The broken symmetry approach requires the 
modelling of multiple spin states using DFT but the final solution obtained 
 can be dependent on the states modelled [@Cremades1; @Cremades2; 
@Rajeshkumar; @Vignesh; @Mn6]. To remove this dependency, more states 
can be modelled but this procedure results in a large number of solutions, 
which have to be averaged in some sensible way. Additionally, the problem of 
singular solutions also arises, which must be identified and removed. 
Until now, however, there has been no convenient way to do so. 

The purpose of this 
package is to provide a means to accomplish this arduous task. Additionally, 
this package can also calculate the temperature dependence of magnetic 
susceptibility, thereby enabling the comparison of computational data with
experiment. Although other codes like MAGPACK [@magpack] and PHI [@phi]
are available for the calculation of the magnetic susceptibility, 
this package provides a one-stop solution for the calculation of coupling 
constants and the determination of the magnetic susceptibility using these 
coupling constants.


# `J2suscep`

This package essentially contains two standalone codes written in FORTRAN 2008 – 
`ej_calc` and `suscep`. Both codes rely only on the LAPACK library [@Lapack]. The 
code `ej_calc` uses the data obtained from the DFT calculations and determines the 
isotropic exchange coupling between paramagnetic centres. With a completely 
programmable Hamiltonian, this code allows the calculation of any number of 
J-values and is only limited by the number of states modelled. It employs the spin 
density approach [@spin_dens], and spin densities obtained from any approach can be used for the 
calculation of J-values. The code calculates all possible solutions based on the 
Hamiltonian and the states modelled, removes any singular solutions and calculates 
an average set of coupling constants and the standard deviations. Additionally, it 
also calculates the energy of the different spin states relative to each other using 
the coupling constants, for comparison to the original DFT data.

The `suscep` code calculates the temperature dependence of magnetic susceptibility 
using the coupling constants. Similar to `ej_calc`, the Hamiltonian is flexible and 
any number of coupling constants can be provided for the calculation of the magnetic 
susceptibility. 

To illustrate the use of this package, we present the example of the Mn$_6$ complex 
shown in Figure 1 (a) [@Mn6]. The Mn atoms are arranged in an octahedron, resulting in 
each Mn being cis to 4 other Mn atoms and trans to 1 Mn atom with the Mn atoms 
interacting via Cl^-^ and phosphonate bridges. One requires 2 J-values 
to account for these cis- and trans- interactions between Mn centres. Modelling of 6 states 
for the calculation of the 2 J-values results in 60 possible solutions; using `ej_calc`, 
the final values were determined to be -1.28 (cis-coupling) and -3.48 cm^-1^ (trans-coupling) 
respectively [@Mn6]. The use of the `suscep` code calculates the temperature dependence of 
susceptibility which is shown in Figure 1 (b). This package has been used in a similar manner 
for probing the magnetic properties of a Mn$_8$ complex [@Mn8].

![(a) Structure of the Mn$_6$ complex and (b) the temperature dependence of magnetic 
susceptibility obtained using the suscep code. Colour scheme: Mn (dark blue), P (pink), Cl (green), 
C (black), N (blue) and O (red). Hydrogen atoms have been removed for clarity.](plot.tif)


# Acknowledgements

The authors are grateful to the Irish Research Council (GOIPG/2015/2952), Science Foundation 
Ireland (12/IA/1414 and 13/IA/1896) and the European Research Council (CoG 2014–647719) for funding.
The authors also  acknowledge ICHEC for computational resources.  


# References
