!This code can be used to calculate the temperature dependence of magnetic
!susceptibility (Chi*T vs T plot). 
!Only the dependence of Chi on the strength of exchange coupling between
!metal centres, and the Zeeman splitting are taken into account in this
!code.

Program suscep 
 Use Iso_Fortran_Env
 Implicit None
 Integer, parameter :: int_kind = INT32
 !Integer, parameter :: int_kind = INT64
 !Integer, parameter :: int_kind = INT128
 !Integer, parameter :: real_kind = REAL32 !Single Precision
 Integer, parameter :: real_kind = REAL64 !Double precision
 Integer, parameter :: comp_kind = REAL64 !Double precision
 Real(kind = real_kind) :: pi
 Integer(kind = int_kind) :: i, j, dmension, no_of_j_val, totalspin, spin_mat_col, j_mat_col
 ! dmension is the number of magnetic centres
 ! no_of_j_val stores the total number of unique J-values defined for the Hamiltonian
 ! totalspin stores the row (or column) size of the spin hamiltonian matrix
 ! spin_mat_col stores the column size of the spin matrix 
 ! j_mat_col stores the column size of the J value matrix
 Integer(kind = int_kind) :: ios
 Real(kind = real_kind), Dimension(:), Allocatable :: spin, jval, posval
 ! spin stores the S value (i.e. total number of unpaired electrons/2) for each
 !metal centre 
 ! jval stores the different J-values in use
 ! posval description given in the subroutine FormBasis
 Integer(kind = int_kind), Dimension(:), Allocatable :: pseudospin
 ! pseudospin is simply a pointer pointing to the position of each metal centre
 Integer(kind = int_kind), Dimension(:,:), Allocatable :: jmat
 ! jmat is the J-value matrix storing information about which J-values 
 !are associated with different spin pairs
 Real (kind = real_kind), Dimension(:,:), Allocatable :: hamil 
 ! hamil is the spin hamiltonian matrix
 Real(kind = real_kind) :: g
 ! g is the 'g' value/tensor (isotropic behaviour has been assumed here) 
 Real(kind = real_kind) :: B, vac_perm, field_str
 ! B = magnetic induction(Wb m-2)
 ! field_str stores the strength of the applied field, B = magnetic induction(Wb m-2)
 ! vac_perm = permeability of free space in vacuum(Wb A-1 m-1) = (4*pi)*(10^-7)
 Real(kind = real_kind), Dimension(:,:), Allocatable :: spinmat, basis
 ! spinmat stores all possible Ms values for each metal centre
 ! basis stores all possible combinations of Ms values of all metal centres
 Character (Len = 100) :: FileName, read_line, Outfile
 ! FileName stores the name of the input file
 ! Outfile stores the name of the output file
 Logical :: EndOfFile
 Call Get_Command_Argument(1, FileName)
 Outfile = trim(Filename) // '.txt'
 Open (Unit = 11, file = FileName, action = 'read', position = 'rewind', iostat = ios)
 Open (Unit = 12, file = Outfile, status = 'unknown', action = 'readwrite')
 totalspin = 1
 Rewind(11)
 EndOfFile = .False.
 Write(12,*) 'Please cite: Altering the nature of coupling by changing the oxidation state in a {Mn6} cage, DOI: 10.1039/D0DT01404D.'
 Write(12,*)
 Call Init()
 Call printer()
 Call SpinMatForm()
 Call FormBasis()
 Call HamilForm(totalspin)
 Deallocate (spin, basis, pseudospin, hamil)
 Deallocate (spinmat, posval, jval, jmat)
 Close(11)
 Close(12)

        
 Contains

 Subroutine Init()
   !!!!! Declaration and initailisation of variables !!!!!
        Character (Len = 1) :: buff
        Logical :: check, check1
        Integer(kind = int_kind) :: i1, j1
        check = .False.
        check1 = .False.
        168 Format(i2)
        189 Format(F4.1)
        193 Format(F6.3)
        245 Format(F22.17)
        pi = 4.0_real_kind*DAtan(1.0_real_kind) !4.0*Atan(1.0) is the value of pi
        i1 = 0
        j1 = 0
        j_mat_col = 1
        vac_perm = 4.0_real_kind*pi/10000000.0_real_kind
   !!!!! Declaration and initailisation ends !!!!!

   !!!!! Determining number of magnetic centres (i.e. metal atoms) !!!!!
   !!!!! Initialisation of spin for each metal centre !!!!!
        Read(11, '(a)', iostat = ios) read_line
        If(trim(read_line) == 'magnetic centres') Then
                Read(11, 168) dmension
        Else 
                Write(*,*) ' Erroneous number of magnetic centres in the input file' 
                Call Abort
        End If
        Write(12,*) "Number of Magnetic centers:", dmension
        Allocate(spin(dmension))
        Allocate(pseudospin(dmension))
        Do i = 1, dmension
                spin(i) = 0
        End Do
   !!!!! Determination of magnetic centres and their initialization ends !!!!!

   !!!!! Reading in the actual values of spin for each centre !!!!!
        Read(11, '(a)', iostat = ios) read_line
        If(trim(read_line) == 'spin') Then
                Do i = 1, dmension
                        Read(11, 189) spin(i)
                        pseudospin(i) = i
                        totalspin = totalspin * (2*spin(i) + 1)
                End Do
        End If
        Do i = 1, dmension
                If(spin(i) == 0) Then
                        Write(*,*) "Erroneous spin values"
                        Call Abort
                End If
        End Do
   !!!!! Reading of spins ends !!!!!

   !!!!! Determining the number of J values, reading them and printing them!!!!!
        Read(11, '(a)', iostat = ios) read_line
        If(trim(read_line) == 'No. of J values') then
                Read(11, 168) no_of_j_val 
        Else
                Write(*,*) ' Erroneous No. of J values'
                Call Abort
        End If
        Allocate(jval(no_of_j_val))
        Read(11, '(a)', iostat = ios) read_line
        If(trim(read_line) == 'J values') then
                Write(12,'(a)', advance = 'no') ' The J values(cm-1) given are:'
                Do i = 1, no_of_j_val
                        Read(11, 245) jval(i)
                        Write(12, 245, advance = 'no') jval(i)
                        Write(12,'(a)', advance = 'no') "  "
                End Do
        Else
                Write(*,*) ' Erroneous J values'
                Call Abort
        End If
        Write(12,*)
   !!!!! J value determination ends !!!!!

   !!!!! Determining the g value!!!!!
        Read(11, '(a)', iostat = ios) read_line
        If (trim(read_line) == 'g value') Then
                Read(11, 193) g
                Write(12,*) 'g value:', g
        Else
                Write(12,*) 'Erroneous g value'
                Call Abort
        End If
   !!!!! G value determination ends!!!!!

   !!!!! Reading in and printing the Spin Hamiltonian !!!!!
        Read(11, '(a)', iostat = ios) read_line
        If(trim(read_line) == 'Hamiltonian') Then
                Read(11, '(a)', iostat = ios) read_line
        Else
                Write(*,*) 'No Hamiltonian'
                Call Abort
        End If

   !!!!! Determining the number of variables in the Hamiltonian !!!!!
        Do i = 1, len_trim(read_line)
                If(read_line(i:i) == '(') Then
                        check = .Not.check
                End If
                If (check .eqv. .True.) Then
                        if (read_line(i:i) == '+') Then
                                i1 = i1 + 1
                        End If
                End If
                If (read_line(i:i) == ')') Then
                        check = .Not.check
                        If (i1 > j1) Then
                                j1 = i1
                                i1 = 0
                        End If
                End If
        End Do
        j_mat_col = j1 + 1
        Allocate(jmat(no_of_j_val, j_mat_col))
        Do i = 1, no_of_j_val
                Do j = 1, j_mat_col
                        jmat(i, j) = 0
                End Do
        End Do
        i1 = 1
        j1 = 1

   !!!!! Reading in each interaction of the spin Hamiltonian !!!!!
        Do i = 1, len_trim(read_line)
                If (read_line(i:i) == '(') Then
                        Read(read_line(i + 1:i + 2), 168) jmat(i1, j1)
                        j1 = j1 + 1
                        If (j1 > j_mat_col) Then
                                i1 = i1 + 1
                                j1 = 1
                        End If
                        check = .Not.check
                End If
                If (read_line(i:i) == '+' .AND. check .eqv. .True.) Then
                        Read(read_line(i + 2:i + 3), 168) jmat(i1, j1)
                        j1 = j1 + 1
                        If (j1 > j_mat_col) Then
                                i1 = i1 + 1
                                j1 = 1
                        End If
                End If
                If (read_line(i:i) == ')') Then
                        if (j1 > 1) Then
                                i1 = i1 + 1
                                j1 = 1
                        End If
                        check = .Not.check
                End If
        End Do
   !!!!! Reading and printing of the Spin Hamiltonian ends !!!!!

   !!!!! Reading in the field strength !!!!!
        166 Format(F10.3)
        Read(11,'(a)', iostat = ios) read_line
        If(trim(read_line) == 'Field Strength') Then
                Read(11,166) field_str !Field strength needs to be in oersted
                field_str = field_str * 1000.0_real_kind/(4.0_real_kind*pi) !A/m
        End If
        !Write(12,*) ' Vac', vac_perm
        B = vac_perm * field_str !Wb m-2 or T
        !Write(12,*) 'Field Strength(A m-1) :', field_str
        !Write(12,*) 'Magnetic Induction(Wb m-2 or T) :',  B
        B = B / 2.350517550e5_real_kind !atomic units
   !!!!! Reading in the field strength ends !!!!!

 End Subroutine Init

 Subroutine printer()
         Write(*,*)'Report available in the file', Outfile
         Write(12,*) "Dimension of hamiltonian matrix", totalspin
         Write(12, '(a)', advance='no') " Rows X Columns in Hamiltonian matrix:"
         Write(12, 220, advance='no') totalspin
         220 Format(i5)
         Write(12,'(a)', advance='no') ' X'
         Write(12,220) totalspin
         Write(12,*) "Metal Number:"
         Write(12,*) pseudospin
         Write(12,*) "Spin on the Metal:"
         189 Format(9x, F4.1)
         Do i = 1, dmension
                 Write(12, 189, advance = 'no') spin(i)
         End Do
         Write(12,*)
         Write(12,*) 'J value (cm-1) with the pairs on which they act'
         249 Format(1x, F19.4)
         168 Format(i2)
         Do i = 1, no_of_j_val
                 Write (12, 249, advance = 'no') jval(i)
                 Write (12, '(a)', advance = 'no') '  '
                 Do j = 1, j_mat_col
                         If (jmat(i, j) == 0) Then
                                 Write (12, '(a)', advance = 'no') 'xx  '
                         Else
                                 Write (12, 168, advance = 'no') jmat(i, j)
                                 Write (12, '(a)', advance = 'no') '  '
                         End If
                 End Do
                 Write(12,*)
         End Do
 End Subroutine printer
 
 Subroutine SpinMatForm()
   !!!!! Determination of the Ms values for each spin centres!!!!!

   !!!!! Declaration and allocation of variables !!!!!
        Integer(kind = int_kind) :: y, a, b, i1, j1, k, l, row, column, t, spinmatdim
        Real(kind = real_kind) :: maxspin, x
        maxspin = spin(1)
        k = 1
        !Determining what is the highest number of unpaired electrons associated
        !with the metal centres under consideration
        Do i1 = 2, dmension 
                x = spin(i1)
                If (x > maxspin) Then 
                        maxspin = x
                End If
        End Do
        !Determination ends
        spinmatdim  = 2.0 * maxspin + 1
        spin_mat_col = spinmatdim
        Allocate (spinmat(dmension, spinmatdim))
   !!!!! Declaration and allocation ends !!!!!
        
   !!!!! Initialising all the Ms values !!!!!
        Do i1 = 1, Size(spin)
                Do j1 = 1, spinmatdim
                        spinmat(i1, j1) = -50
                End Do
        End Do
   !!!!! End of initialisation !!!!!

   !!!!! Storing the actual Ms values !!!!!
        Do i1 = 1, Size(spin) 
                x = spin(k)
                Do j1 = 1, spinmatdim
                        If (x >= -1 * spin(k)) Then
                                spinmat(i1,j1) = x
                        End if
                        x = x - 1
                End Do
                k = k + 1
        End Do
   !!!!! Storing ends !!!!!

   !!!!! Write up !!!!!
        168 Format(i3)
        Write (12,'(a)', advance = 'no') "size of spin matrix:"
        Write (12, 168, advance = 'no') Size(spin)
        Write (12,'(a)', advance = 'no') ' X '
        Write (12, 168, advance = 'no') spinmatdim
        Write (12,'(a)', advance = 'no') " = "
        Write (12, 168, advance = 'no')  Size(spinmat)
        Write (12,*)

        Write(12,*) "Magnetic Spin Quantum no. Ms matrix:"
        Do i1 = 1, Size(spin) 
                Do j1 = 1, spinmatdim
                        If (spinmat(i1,j1) == -50) Then
                                Write(12,'(a)',advance = 'no') "   xx"
                        Else
                                Write(12,145, advance = 'no') spinmat(i1,j1)
                                145 Format(1x, F5.1)
                        End If
                End Do
                Write(12, *)
        End Do
   !!!!! Write up ends !!!!!

 End Subroutine SpinMatForm

        
 Subroutine FormBasis()
   !!!!! Forming the basis which would span the spin hamiltonian !!!!!

   !!!!! Declaration and Initialization !!!!!
        Integer(kind = int_kind) :: k, counter, counter1, t
        Integer(kind = int_kind), Dimension(:), Allocatable :: pos
        !pos acts as a pointer for the values of spinmat 
        !posval stores the Ms value corresponding to the pointers provided by pos
        Allocate(pos(dmension))
        Allocate(posval(dmension))
        Allocate(basis(totalspin, dmension))
        168 Format(i2)
        189 Format(F4.1)
        counter = 1
   !!!!! Declaration and Initialization ends !!!!!
   
   !!!!! Determining the values of the actual basis and the pseudo analogues !!!!!
        Do k = 1, Size(pos)
                pos(k) = 1
                basis(1,k) = spinmat(k,pos(k))
                posval(k) = spinmat(k,pos(k))
        End Do
        Do k = 1, totalspin
                Do counter = 1, Size(pos)
                        basis(k,counter) = posval(counter)
                End Do
                If (k < totalspin) Then
                        Call UpdatePos(pos)
                End If
        End Do
   !!!!! End of Determination of basis !!!!!

        Deallocate(pos)
 End Subroutine FormBasis


 Subroutine CheckPos(posit) !Helper routine for UpdatePos()
        Integer(kind = int_kind), Dimension(:), Allocatable :: posit
        Integer(kind = int_kind) :: k, matsiz, t
        matsiz = Size(posit)
        Do k = Size(posit), 2, -1
                If (posit(k) > spin_mat_col) then
                        posit(k) = 1
                        posit(k - 1) = posit(k - 1) + 1
                End If
                If (spinmat(k,posit(k)) == -50.0) Then
                        posit(k) = 1
                        posit(k - 1) = posit(k - 1) + 1
                End If
        End Do
 End Subroutine CheckPos


 Subroutine UpdatePos(posit1) !Helper for FormBasis()
        Integer(kind = int_kind), Dimension(:), Allocatable :: posit1
        Integer(kind = int_kind) :: k, matsiz, t
        matsiz = Size(posit1)
        posit1(matsiz) = posit1(matsiz) + 1
        Call CheckPos(posit1)
        168 Format(i2)
        189 Format(F4.1)
        Do k = 1, Size(posit1)
                posval(k) = spinmat(k, posit1(k))
        End Do
 End Subroutine UpdatePos


Subroutine HamilForm(matdimen) 
   !!!!! Defining the Spin Hamiltonian(SH) !!!!!
        Integer(kind = int_kind) :: matdimen, x, y, a, b, i1, j1, k, l, row, column, m  
        Real(kind = real_kind) :: t, t1, low, rais, dot
        t = 1.0_real_kind
        Allocate (hamil(totalspin,totalspin))
        jval = jval * 4.55633538e-6_real_kind !converting to Hartrees
        Do i = 1, totalspin !Initialisation of SH
                Do j = 1, totalspin
                        hamil(i,j) = 0.0
                End Do
        End Do !Initialization ends
        Do i = 1, totalspin
            Do j = 1, totalspin !i,j used for running through each value of SH
                Do k = 1, no_of_j_val !for using all J values 
                    Do l = 1, j_mat_col !for each S1S2 term defined under a given J value
                        If (jmat(k,l) .ne. 0) Then
                            x = jmat(k,l)/10
                            y = Mod(jmat(k,l), 10)
                            Do m = 1, dmension
                                If (basis(i,m) .ne. -50 .AND. basis(j,m) .ne. -50) Then
                                    If (m .ne. x .AND. m .ne. y) Then
                                        !Write(12,*) 't init if', t
                                        If (basis(i,m) == basis(j,m)) Then
                                            t = t * kron_del(basis(i,m),basis(j,m))
                                        Else
                                            t = 0.0_real_kind
                                        End If
                                    End If
                                End If
                            End Do
                            rais = 0.5_real_kind*Dsqrt(spin(x)*(spin(x)+1)-basis(j,x)*(basis(j,x)+1))& 
                            &*Dsqrt(spin(y)*(spin(y)+1)-basis(j,y)*(basis(j,y)-1))& 
                            &*kron_del(basis(i,x),basis(j,x)+1)*kron_del(basis(i,y),basis(j,y)-1)

                            low = 0.5_real_kind*Dsqrt(spin(x)*(spin(x)+1)-basis(j,x)*(basis(j,x)-1))&
                            &*Dsqrt(spin(y)*(spin(y)+1)-basis(j,y)*(basis(j,y)+1))&
                            &*kron_del(basis(i,x),basis(j,x)-1)*kron_del(basis(i,y),basis(j,y)+1)

                            dot = basis(j,x)*basis(j,y)&
                            &*kron_del(basis(i,x),basis(j,x))*kron_del(basis(i,y),basis(j,y))

                            t1 = rais + low + dot
                            t = t * t1 *-2.0_real_kind * jval(k) 
                        hamil(i,j) = hamil(i,j) + t
                        t = 1.0_real_kind
                        End If
                    End Do
                End Do
            End Do
        End Do
        168 Format(i2)
        Write (12,*)
        189 Format(1x, F19.2)
   !!!!! Definition Ends !!!!!

        Call Zeeman()
End Subroutine HamilForm   


Integer Function kron_del(a, b)
        Real(kind = real_kind) :: a, b
        If (a == b) Then
                kron_del = 1.0_real_kind
        Else
                kron_del = 0.0_real_kind
        End If
End Function kron_del
       

Subroutine Diag(mtd, w) !Diagonalization routine       
        Integer(kind = int_kind) :: n, sdim, lwork, info, lda, lrwork, liwork, abstol
        Character (Len = 1) :: Jobvs, Sort
        Real(kind = real_kind), Allocatable, Dimension (:) :: w, rwork, d, e
        Complex(kind = comp_kind), Allocatable, Dimension (:) :: work, tau
        Complex(kind = comp_kind), Allocatable, Dimension (:,:) :: mtd !matrix to be diagonalized
        !It ia known that all the matrix that require diagonlization here have the dimension (totalspin, totalspin). 
        Integer, Allocatable :: iwork(:)
        n = totalspin
        lda = n
        lwork = 2*n 
        lrwork = 24*n
        liwork = 10*n
        Allocate(work(lwork), rwork(lrwork), d(n), e(n-1), tau(n-1), iwork(liwork))
        sdim = 0
        Jobvs = 'N'
        Sort = 'N'
        Call ZHEEV('N',     'U' , n ,mtd,   n , w , work , lwork , rwork , info)
        !call zheev(jobz , uplo , n , a , lda , w , work , lwork , rwork , info)
        !LAPACK routine for matrix diagonalisation
End Subroutine Diag


Subroutine Zeeman()
   !!!!! Allocation !!!!!
        Integer(kind = int_kind) :: k, l, N
        Real(kind = real_kind) :: tempre, tempcm, temp1, raisre, lowre, dot, raiscm, lowcm, del, loc_B, bm
        Real(kind = real_kind), Allocatable, Dimension(:) :: eigena1, eigena2, eigena3
        Complex(kind = comp_kind), Allocatable, Dimension(:,:) :: hamil1, hamil2, hamil3
        loc_B = B/Dsqrt(3.0_real_kind)
        !loc_B is the effective value of B along x, y and z-axis assuming that B
        !is the same along each direction
        del = loc_B/(10.0_real_kind) !i.e. B/(10*dsqrt(3.D0)
        !del gives the increment in B along different directions because of which
        !the increment here is different when compared to the increment in the
        !suscep_calc subroutine where delt = B/10
        bm = 0.5 !Bohr Magneton in atomic units =  9.27400968e-24 J T-1
        N = -1
        !Write(12,*)'BM', bm
        Allocate(hamil1(totalspin, totalspin))
        Allocate(hamil2(totalspin, totalspin))
        Allocate(hamil3(totalspin, totalspin))
        Allocate(eigena1(totalspin))
        Allocate(eigena2(totalspin))
        Allocate(eigena3(totalspin))
   !!!!! Allocations end !!!!!

   !!!!!Introduction of Zeeman factor in the Hamiltonians!!!!!
        Do i = 1, totalspin
                Do j = 1, totalspin
                        tempre = 0
                        tempcm = 0
                        Do l = 1, dmension
                                temp1 = 1
                                Do k = 1, dmension
                                        If ( k == l) Then
                                                dot = bm * g * basis(j,k) *&
                                                & kron_del(basis(i,k), basis(j,k))
                                                raisre = 0.5_real_kind * bm * g * &
                                                & Dsqrt((spin(l) - basis(j,k) + 1)*(spin(l) + basis(j,k)))&
                                                & * kron_del(basis(i,k), basis(j,k)-1)
                                                raiscm = raisre
                                                lowre = 0.5_real_kind * bm * g * &
                                                & Dsqrt((spin(l) + basis(j,k) + 1)*(spin(l) - basis(j,k)))& 
                                                & * kron_del(basis(i,k), basis(j,k)+1)
                                                lowcm = lowre
                                        Else
                                                temp1 = temp1 * kron_del(basis(i,k), basis(j,k))
                                        End If
                                End Do
                                tempre = tempre + temp1*(raisre + lowre + dot)
                                tempcm = tempcm + temp1*(raiscm - lowcm)
                        End Do
                hamil1(i,j) = DCmplx(hamil(i,j) + tempre*(loc_B+N*del), tempcm*(loc_B+N*del))
                N = N + 1
                hamil2(i,j) = DCmplx(hamil(i,j) + tempre*(loc_B+N*del), tempcm*(loc_B+N*del))
                N = N + 1
                hamil3(i,j) = DCmplx(hamil(i,j) + tempre*(loc_B+N*del), tempcm*(loc_B+N*del))
                N = -1
                End Do
        End Do
   !!!!!Zeeman Factor has been introduced!!!!!     

   !!!!!Call for Eigen Value determination!!!!! 
        call Diag(hamil1, eigena1)
        call Diag(hamil2, eigena2)
        call Diag(hamil3, eigena3)
        eigena1 = (eigena1)* 219474.625_real_kind !cm-1
        eigena2 = (eigena2)* 219474.625_real_kind
        eigena3 = (eigena3)* 219474.625_real_kind
   !!!!!Call ends!!!!!
        
        call suscep_calc(eigena1, eigena2, eigena3)
End Subroutine Zeeman


Subroutine suscep_calc(eigenb1, eigenb2, eigenb3)
   !!!!! Declaration and allocation of variables and arrays !!!!!
        Real(kind = real_kind), Allocatable, Dimension (:) :: eigenb1, eigenb2, eigenb3
        Real(kind = real_kind), Allocatable, Dimension (:,:) :: c
        Real(kind = real_kind), Allocatable, Dimension (:,:) :: eigen1
        Real(kind = real_kind), Allocatable, Dimension (:,:) :: work
        Real(kind = real_kind),  Allocatable, Dimension (:,:) :: B_mat
        Real(kind = real_kind),  Allocatable, Dimension (:) :: ipiv
        Real(kind = real_kind) :: N, Avo_num, beta, g, k, T, del, conv
        Integer(kind = int_kind) :: m, m1, m2, info
        Integer(kind = int_kind),  Allocatable, Dimension (:,:) :: x
        Logical :: check
        Real(kind = real_kind) :: chi, temp, temp1, delt, bltz_cnst, chi_T
        Allocate(c(totalspin, 3))
        Allocate(eigen1(totalspin, 3))
        Allocate(B_mat(3,3), x(3,3))
        Avo_num = 6.022140857e23_real_kind !mol-1
        B = B * 2.350517550e5_real_kind
        !Write(12,*) 'Magnetic Induction(Wb m-2 or T):', B
        check = .True.
        N = -1
        m = 3
        m1 = 4
        m2 = 5
        delt = B/10.0_real_kind
        Allocate(work(m,m))
        Allocate(ipiv(m))
        T = 1 !Temperature in Kelvin 
        bltz_cnst = 0.695039_real_kind !cm-1 K-1 
        beta = 1 / (T * bltz_cnst) 
   !!!!! Declaration and allocation part ends !!!!!

   !!!!! Assignment of values to the B matrices and the eigen value matrices !!!!!
        Do i = 1, 3
                Do j = 1, 3
                        If (i == 1) Then
                                If (check  == .True.) Then
                                        Do k = 1, totalspin
                                                eigen1(k,i) = eigenb1(k)
                                         End Do
                                         check = .False.
                                End If
                                If (j <= 3) Then
                                        B_mat(i,j) = 1.0_real_kind
                                End If
                        Else 
                                If (check  == .True.) Then
                                        if (i == 2) then
                                        Do k = 1, totalspin
                                                eigen1(k,i) = eigenb2(k)
                                        End Do
                                        Else
                                        Do k = 1, totalspin
                                                eigen1(k,i) = eigenb3(k)
                                        End Do
                                        End If
                                        check = .False.
                                End If   
                                If (j <= 3) Then
                                        B_mat(i, j) = (0 + (N * delt)) ** (i - 1) 
                                End If
                        End If
                        N = N + 1
                        check = .True.
                End Do
                N = -1
        End Do
   !!!!! Assignment of values finished !!!!!

   !!!!! Determination of the coefficent matrices !!!!!
        !call dgetrf(m, n, a,   lda, ipiv, info)
        call dgetrf(m, m, B_mat, m, ipiv, info)
        !call dgetri ( n, a, lda, ipiv, work, lwork, info )
        call dgetri (m, B_mat, m, ipiv, work, m, info)
        c = Matmul(eigen1, B_mat)
   !!!!! Determination of the coefficent matrices ends !!!!!

   !!!!!Determination of Chi!!!!!     
        Write(12,*) "Temperature           Chi                  Chi*Temp"
        178 Format(F25.9)
        193 Format(F12.4)
        conv = 1.98644746e-23_real_kind
        Do T = 1, 300 !temperature
                temp  = 0
                temp1 = 0
                Do j = 1, totalspin !equal to Size(eigenb1) 
                        temp = temp + DExp(-c(j,1)/(bltz_cnst*T)) * (((c(j, 2) * c(j, 2))/(bltz_cnst*T)) - 2.0_real_kind*c(j,3))
                        temp1 = temp1 + DExp(-c(j,1)/(bltz_cnst*T))
                End Do
                chi = conv * Avo_num * (temp / temp1) * vac_perm  / (4.0_real_kind * pi * 1.0e-6_real_kind) !cm3/mol 
                chi_T = chi * T !cm3K/mol
                Write(12, 193, advance = 'no') T
                Write(12, 178, advance = 'no') chi
                Write(12, 178) chi_T
        End Do
   !!!!!Determination ends!!!!!

End Subroutine suscep_calc

End Program suscep

