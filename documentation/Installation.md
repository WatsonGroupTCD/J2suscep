<html><head></head><body>


<h1>Installation Instructions</h1>

<p> For compilation, a FORTRAN compiler, and BLAS and LAPACK libraries are required.
To install the code, specify the compiler, the relevant compiler specific options and 
the path to BLAS and LAPACK libraries in the file 'makefile.include' present in the src 
directory. The relevant options for the GNU and Intel FORTRAN compilers are provided in 
the 'arch' subdirectory. </p>
<p> <b>Note:</b> If you are using the GNU fortran compiler, then ensure that you have version 7.3.1 or newer.</p>
<p>For a fresh installation, use the following command:</p>
<pre>
make
</pre>
<p>This should compile the ej_calc 
and suscep codes and place the generated executables (ej_calc_form, ej_calc_spin, suscep) 
in the 'bin' directory outside the 'src' directory.</p>
<p>For a clean installation, use the following commands:</p>
<pre>
make clean
make
</pre>
<h2>Testing the code</h2>
<p>The 'test' directory contains tests to verify the proper compilation of the code.
To run the basic tests, use the following command:</p>
<pre>
make
</pre>
<p>This will run the basic tests. Depending upon the machine and whether the compiler 
specific optimisations have been included in the compilation of the code, the execution 
of these tests may take from seconds to minutes. For most purposes, these tests are sufficient to 
verify the validity of the code.</p>
<p> To run the comprehensive tests, use the following command:</p>
<pre>
make large
</pre>
<p>This will run the longer tests. Depending upon the machine and whether the compiler 
specific optimisations have been included in the compilation of the code, the execution 
of these tests may take anytime between a few hours to a day. 
<p>To run the short and comprehensive tests together, use the following command:</p>
<pre>
make all
</pre>
<p>One can also test each executable individually by using one of the following commands depending upon which code needs to be tested:</p>
<pre>
make test_ej_calc_form
make test_ej_calc_spin
make test_suscep
</pre>

<p></p>




    
</body></html>