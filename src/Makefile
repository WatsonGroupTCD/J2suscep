
.PHONY: all clean ej_calc suscep

all:  ej_calc_form ej_calc_spin suscep 

ej_calc_form:         
	cp makefile.include ej_calc/.
	make -C ej_calc TYPE=formal
	cp ej_calc/build_form/ej_calc_form ../bin/.

ej_calc_spin:         
	cp makefile.include ej_calc/.
	make -C ej_calc TYPE=spin_density
	cp ej_calc/build_spin/ej_calc_spin ../bin/.

suscep:
	cp makefile.include suscep/.
	make -C suscep 
	cp suscep/build/suscep ../bin/.

clean:
	make -C ej_calc clean 
	make -C suscep clean 
	pwd 
	rm ../bin/ej_calc_form
	rm ../bin/ej_calc_spin
	rm ../bin/suscep          

  
