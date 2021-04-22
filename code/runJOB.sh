#!/bin/bash
#
# splitting the all.jobs file according to node distribution
# in the PWD numbered files [1 -> splits] are created and deleted after
JOBFILE=code/all.jobs
splits=FIXME

parallel -j${splits} --block -1 -a $JOBFILE --header : --pipepart 'cat > {#}'
# submitting independent SLURM jobs for efficiency and robustness
parallel 'sbatch code/catpart.sbatch {}' ::: $(seq ${splits})

