#!/bin/bash
#SBATCH --job-name=05-buggy
#SBATCH --account=notchpeak-shared-short
#SBATCH --partition=notchpeak-short-shared
#SBATCH --time=00:10:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
#SBATCH --output=%x-%j.out

module load R
export OMP_NUM_THREADS=1

Rscript --vanilla 05-buggy.R 10000 10000
