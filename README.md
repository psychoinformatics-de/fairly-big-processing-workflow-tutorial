# Preprocessed structural data from the studyforrest project

This dataset contains the results of an fMRIprep-based, anatomical preprocessing
workflow of structural studyforrest data (studyforrest.org).

All results are fully and automatically reproducible with
[datalad](http://www.datalad.org). The details of this workflow are described at
https://github.com/psychoinformatics-de/processing-workflow.

## Software requirements for automatic recomputation

- [DataLad](http://www.datalad.org)
- [Singularity](https://sylabs.io/docs/)

## How to recompute

First, clone this dataset with DataLad.
Next, take a look at the Git history of the data and identify the 40-character long
commit shasum of a single-subject computation, then use this shasum in a
``datalad rerun`` command:

```
$ datalad rerun a95484c793793b7274dbef5239e0cc3d315ca0fe
```

## How to obtain data without recomputation

First, cline this dataset with DataLad.
Next, retrieve any file(s) of your choice with the ``datalad get`` command.

