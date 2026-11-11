#!/bin/bash
#SBATCH --job-name=02-mclapply
#SBATCH --account=notchpeak-shared-short
#SBATCH --partition=notchpeak-shared-short
#SBATCH --time=00:10:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
#SBATCH --output=%x-%j.out

# Case 2: one job, several cores on ONE node.
# --cpus-per-task reserves the cores; 02-mclapply.R reads SLURM_CPUS_PER_TASK
# so that R uses exactly those cores. Change the number here, nowhere else.

module load R
export OMP_NUM_THREADS=1

Rscript --vanilla 02-mclapply.R 10000 100000
