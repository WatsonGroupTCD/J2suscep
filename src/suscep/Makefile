#

include makefile.include 

# lines from here down should not need to be changed 

#  object path and ffp options for code using formal (integer) spins. 
#
 OBJECTS = suscep.o 
  
 PROG = suscep   
 OBJDIR = build

# put .mod files with objects 
 MOD = $(MODCMD)  $(OBJDIR) 
 

$(OBJDIR)/%.o: %.f90 
	mkdir -p $(OBJDIR)
	$(FC) $(FPP_OPTIONS) $(FFLAGS) $(OPT) $(BLAS) $(MOD) -o $@  -c $< 

OBJPROG = $(addprefix $(OBJDIR)/,$(PROG))

$(OBJPROG): $(addprefix $(OBJDIR)/,$(OBJECTS))
	$(FC) $(FPP_OPTIONS) $(FFLAGS) $(OPT) $(MOD) $^  -o $@  $(BLAS_LIB)
 
clean:
	rm -f build/*.o 
	rm -f build/*.mod
	rm -f build/suscep 
