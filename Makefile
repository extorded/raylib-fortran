build:
	gfortran *.f90 -L/usr/local/lib -I./include/ -lraylib -lm
