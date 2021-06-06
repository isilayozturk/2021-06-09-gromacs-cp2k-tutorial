#!/bin/bash
#SBATCH -J egfp-qmmm-nvt
#SBATCH --time=00:20:00
#SBATCH --account=ta029
#SBATCH --partition=standard
#SBATCH --qos=standard
#SBATCH --reservation=ta029_181

#SBATCH --nodes=1
#SBATCH --tasks-per-node=32
#SBATCH --cpus-per-task=4

#SBATCH --distribution=block:block 
#SBATCH --hint=nomultithread

module load epcc-job-env
module load /work/d118/shared/GRM_CP2K/module/gromacs-cp2k/2021.2

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OMP_PLACES=cores

srun mdrun_cp2k -npme 0 -s egfp-qmmm-nvt.tpr -deffnm egfp-qmmm-nvt
