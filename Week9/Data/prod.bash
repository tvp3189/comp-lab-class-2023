#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=16GB
#SBATCH --time=1:00:00
#SBATCH --job-name=W9pt2
#SBATCH --mail-type=END
#SBATCH --mail-user=tvp3189@nyu.edu
#SBATCH --output=slurm_%j.out

source /scratch/work/courses/CHEM-GA-2671-2023fa/software/lammps-gcc-30Oct2022/setup_lammps.bash

# Create the system
#mpirun lmp -var configfile ../Inputs/n360/kalj_n360_create.lmp -var id 1 -in ../Inputs/production_3d_binary.lmp

# Cool from 1.5 to 0.45
for TEMP in 1.5 1.0 0.9 0.8 0.7 0.65 0.6 0.55 0.5 0.475
do
    mpirun lmp -var configfile ../Inputs/n360/kalj_n360_T${TEMP}.lmp -var id 1 -in ../Inputs/production_3d_binary.lmp
done

