%nprocshared=16
%mem=50000MB
%chk=ferromagnetic.chk
# opt upbe1pbe/gen geom=allcheck guess=read pseudo=read

C O N H 0
6-31g(d,p)
****
Mn 0
SDDALL
****

Mn 0
SDDALL





