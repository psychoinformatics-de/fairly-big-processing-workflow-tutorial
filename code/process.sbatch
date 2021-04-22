#!/bin/bash -x
### If you need a compute time project for job submission set here
#SBATCH --account=FIXME
#SBATCH --mail-user=FIXME
#SBATCH --mail-type=END
#SBATCH --job-name=FIXME
#SBATCH --output=logs/processing-out.%j
#SBATCH --error=logs/processing-err.%j
### If there's a time limit for job runs, set (max) here
#SBATCH --time=24:00:00
#SBATCH --ntasks-per-node=1
### If specific partitions are available i.e. with more RAM define here
#SBATCH --partition=FIXME
#SBATCH --nodes=1

### Define number of jobs that arer run simultaneously
srun parallel --delay 0.2  -a code/all.jobs --FIXME

wait
