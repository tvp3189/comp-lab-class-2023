#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --cpus-per-task=1
#SBATCH --mem=20GB
#SBATCH --time=6:00:00
##SBATCH --job-name=W12h2o
##SBATCH --mail-type=END
##SBATCH --mail-user=tvp3189@nyu.edu
#SBATCH --output=slurm_%j.out

module load cp2k/openmpi/intel/20201212
mpirun -np 12 cp2k.popt -i water.inp -o OUTPUT_FILE_NAME.log
