#!/bin/bash
#SBATCH --job-name=04-aggregate
#SBATCH --account=notchpeak-shared-short
#SBATCH --partition=notchpeak-shared-short
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --mem=2G
#SBATCH --output=%x-%j.out

# Runs only after every task of the array finished successfully:
#   sbatch --dependency=afterok:<array job ID> 04-aggregate.slurm

module load R
Rscript --vanilla 04-aggregate.R 10000 100000
