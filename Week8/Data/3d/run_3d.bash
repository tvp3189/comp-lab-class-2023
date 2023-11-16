#!/bin/bash
# Runs 2D system for LAMMPS ranging over densities

for VAR in 0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5
do
   mpirun lmp -var density ${VAR}  -in ../../Inputs/3dWCA.in > LOGFILE.log
done
