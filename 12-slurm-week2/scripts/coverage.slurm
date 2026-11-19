#!/bin/bash
#SBATCH --job-name=coverage
#SBATCH --account=notchpeak-shared-short
#SBATCH --partition=notchpeak-shared-short
#SBATCH --time=02:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
#SBATCH --output=%x-%j.out

# The controller job. coverage.R does no heavy computing: slurmR submits the
# replicates as a job array, waits for it, and collects the answers. This job
# only needs one core, a little memory, and enough time to wait for the array.

module load R

Rscript --vanilla coverage.R 1000
