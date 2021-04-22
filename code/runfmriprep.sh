#!/bin/bash

subid=$1

# -----------------------------------------------------------------------------
# create workdir for fmriprep inside the dataset to simplify singularity call
# PWD will be available in the container
mkdir -p .git/tmp/wdir

# pybids (inside fmriprep) will try to read all JSON files in a dataset. In case
# of a recomputation, JSON files of other subjects can be dangling symlinks.
# We prevent pybids from crashing the fmriprep run when it can't read those, by
# wiping them out temporarily via renaming.
# We spare only those that belong to the participant we want to process.
# After job completion, the jsons will be restored.
# See https://github.com/bids-standard/pybids/issues/631 for more information.

find inputs/data -mindepth 2 -name '*.json' -a ! -wholename "$subid" | sed -e "p;s/json/xyz/" | xargs -n2 mv

# execute fmriprep. Its runscript is available as /singularity within the
# container. Custom fmriprep parametrization can be done here.
/singularity inputs/data . participant --participant-label $subid \
    --anat-only -w .git/tmp/wdir --fs-no-reconall --skip-bids-validation \
    --fs-license-file code/license.txt


# restore the jsons we have moved out of the way
find inputs/data -mindepth 2 -name '*.xyz' -a ! -wholename "$subid" | sed -e "p;s/xyz/json/" | xargs -n2 mv

