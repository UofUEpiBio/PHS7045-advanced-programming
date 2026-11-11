#!/bin/bash
#SBATCH --job-name=hello-world
#SBATCH --account=notchpeak-shared-short
#SBATCH --partition=notchpeak-shared-short
#SBATCH --time=00:02:00
#SBATCH --ntasks=1
#SBATCH --mem=1G
#SBATCH --output=%x-%j.out

# Submit with:  sbatch 00-hello-world.slurm
# %x is the job name and %j the job ID, so the log is hello-world-<jobid>.out

module load R
Rscript -e "message('Hello from node ', Sys.getenv('SLURMD_NODENAME'), ', job ', Sys.getenv('SLURM_JOB_ID'))"
