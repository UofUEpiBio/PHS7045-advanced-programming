#!/bin/bash
#SBATCH --job-name=03-array
#SBATCH --account=notchpeak-shared-short
#SBATCH --partition=notchpeak-shared-short
#SBATCH --time=00:10:00
#SBATCH --array=1-4
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
#SBATCH --output=%x-%A_%a.out

# Case 3 (reference solution): 4 array tasks x 4 cores each = 16 cores.
# %A is the array's job ID and %a the task ID, so each task gets its own log.
# Submit together with the aggregation step:
#   jid=$(sbatch --parsable 03-array.slurm)
#   sbatch --dependency=afterok:$jid 04-aggregate.slurm

module load R
export OMP_NUM_THREADS=1

Rscript --vanilla 03-array.R 10000 100000
