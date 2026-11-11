#!/bin/bash
#SBATCH --job-name=01-sapply
#SBATCH --account=notchpeak-shared-short
#SBATCH --partition=notchpeak-shared-short
#SBATCH --time=00:10:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
#SBATCH --output=%x-%j.out

# Case 1: one job, one core.
# Other partitions you can use with the class account:
#   --account=phs7045 --partition=notchpeak-shared-freecycle  (may be preempted)

module load R
export OMP_NUM_THREADS=1

# Simulation size: replicates and points per replicate
Rscript --vanilla 01-sapply.R 10000 100000
