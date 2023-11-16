#!/bin/bash
# Runs 2D system for LAMMPS ranging over densities

for VAR in 0.5 0.6 0.7 0.8 0.9 1.0 1.1
do
   mpirun lmp -var density ${VAR}  -in ../../Inputs/2dWCA.in > LOGFILE.log
done
