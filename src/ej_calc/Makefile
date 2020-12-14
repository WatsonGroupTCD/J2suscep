#
 
include makefile.include


#############################################################################

# lines from here down should not need to be changed 

#  object path and ffp options for code using formal (integer) spins. 
#
 OBJECTS = init.o  enrg_frm_jval.o  modul_lib.o  main.o  
  
ifeq ($(TYPE),spin_density) 
 PROG = ej_calc_spin
 OBJDIR = build_spin
 FPP_OPTIONS = -Dspin_density 
endif 

ifeq ($(TYPE),formal) 
 PROG = ej_calc_form 
 OBJDIR = build_form
 FPP_OPTIONS = -Dformal          
endif 


# put .mod files with objects 
 MOD = $(MODCMD)  $(OBJDIR) 
 

$(OBJDIR)/%.o: %.F90 
	mkdir -p $(OBJDIR) 
	$(FC) $(FPP_OPTIONS) $(FFLAGS) $(OPT) $(BLAS) $(MOD) -o $@  -c $< 

OBJPROG = $(addprefix $(OBJDIR)/,$(PROG))

$(OBJPROG): $(addprefix $(OBJDIR)/,$(OBJECTS))
	$(FC) $(FPP_OPTIONS) $(BLAS_LIB) $(FFLAGS) $(OPT) $(MOD) $^  -o $@  $(BLAS_LIB) 
 
nothing:
	@echo "nothing to do - use 'make TYPE=option' where option is either formal or spin_density"

clean:
	rm -fr build_form 
	rm -fr build_spin 

