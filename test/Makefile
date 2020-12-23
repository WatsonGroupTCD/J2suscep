start = 1
finish = 2

.PHONY: test large test_ej_calc_form test_ej_calc_spin  test_suscep        

test:  test_ej_calc_form test_ej_calc_spin test_suscep 

large: test
large: start = 3
large: finish = 4 

all: test
all: start = 1
all: finish = 4 

test_ej_calc_form:         
	./test.sh ej_calc_form  $(start)  $(finish) 

test_ej_calc_spin:         
	./test.sh ej_calc_spin  $(start)  $(finish)  

test_suscep:         
	./test.sh suscep  $(start)  $(finish)  

clean:
	rm -fr ej_calc_form ej_calc_spin suscep 

  
