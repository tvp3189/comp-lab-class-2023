#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=5:00:00
#SBATCH --mem=2GB
#SBATCH --job-name=1aki_eq
#SBATCH --mail-type=END
#SBATCH --mail-user=tvp3189@nyu.edu
#SBATCH --output=slurm_%j.out

module purge
module load gromacs/openmpi/intel/2020.4

RUNDIR=/home/tvp3189/tvp3189/comp-lab-class-2023/Week3/Data/npt_equil/run-${SLURM_JOB_ID/.*}
mkdir -p $RUNDIR
SETUPDIR=/home/tvp3189/tvp3189/comp-lab-class-2023/Week3/Setup
cd $RUNDIR

cp $SETUPDIR/npt.mdp .
cp $SETUPDIR/nvt.gro .
cp $SETUPDIR/nvt.cpt .
cp $SETUPDIR/topol.top .
cp $SETUPDIR/posre.itp .

gmx_mpi grompp -f npt.mdp -c nvt.gro -r nvt.gro -t nvt.cpt -p topol.top -o npt.tpr
gmx_mpi mdrun -deffnm npt
