#!/bin/sh
#SBATCH --job-name=rcpp-openmp-array
#SBATCH --account=vegayon-np
#SBATCH --partition=vegayon-shared-np
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=00:05:00
#SBATCH --output=slurmlog%a.log
#SBATCH --array=1-2

# Loading R
module load R/4.2.2

#  Running the script
Rscript --vanilla distance.R