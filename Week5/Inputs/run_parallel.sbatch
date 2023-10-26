#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=3
#SBATCH --cpus-per-task=1
#SBATCH --mem=16GB
#SBATCH --time=24:00:00
##SBATCH --job-name=2JOF
##SBATCH --mail-type=END
##SBATCH --mail-user=tvp3189@nyu.edu
#SBATCH --output=slurm_%j.out
mpirun -np 3 gmx_mpi mdrun -s adp -multidir T300/ T363/ T440/ -deffnm adp_exchange3temps -replex 50
