# Preprocessed structural data from the studyforrest project

This dataset contains the results of an fMRIprep-based, anatomical preprocessing
workflow of structural studyforrest data (studyforrest.org).

All results are fully and automatically reproducible with
[datalad](http://www.datalad.org). The details of this workflow are described at
https://github.com/psychoinformatics-de/processing-workflow.


## How to recompute

Make sure to fulfill the [Software Requirements](https://github.com/psychoinformatics-de/fairly-big-processing-workflow#software-requirements) listed below.
Then, clone this dataset with DataLad.
Next, take a look at the Git history of the data and identify the 40-character long
commit shasum of a single-subject computation, then use this shasum in a
``datalad rerun`` command:

```
$ datalad rerun a95484c793793b7274dbef5239e0cc3d315ca0fe
```

## How to obtain data without recomputation

First, clone this dataset with DataLad.
Next, retrieve any file(s) of your choice with the ``datalad get`` command.



## Software requirements for automatic recomputation

Software requirements for the worflow are described in detail [here](https://github.com/psychoinformatics-de/fairly-big-processing-workflow#software-requirements).

If you're not planning to use any job scheduling / batch processing system (e.g. [HTCondor](https://research.cs.wisc.edu/htcondor/), [SLURM](https://slurm.schedmd.com/documentation.html)), but would simply like to run the example below, make sure to have the following software installed:

- [DataLad](http://www.datalad.org): Please make sure that you have installed a recent version of DataLad (`0.14.3` or higher), as well as recent versions of its dependencies (git, `2.24.0` or higher; git-annex, `8.20*` or higher). Installation instructions are available at: [http://handbook.datalad.org](http://handbook.datalad.org/en/latest/intro/installation.html#install).

- [Singularity](https://sylabs.io/docs/): In principle, no specific version of Singularity is required. If you're not sure what version to use, simply install the most recent one. Installation instructions can be found [here](https://sylabs.io/docs/).

Make sure to have your [Git identity](http://handbook.datalad.org/en/latest/intro/installation.html#initial-configuration) set up.

## Installation tips for MacOS

An installation of [Singularity on MacOS](https://sylabs.io/guides/3.8/admin-guide/installation.html#installation-on-windows-or-mac) requires using a virtual machine. It is recommended to use [VirtualBox](https://www.virtualbox.org) and (optionally) [Vagrant](https://www.vagrantup.com) software. This software can be installed via [Homebrew](https://brew.sh) package manager.

```
$ brew install --cask virtualbox && \
    brew install --cask vagrant && \
    brew install --cask vagrant-manager
```

The easiest way to start is to browse the [public Vagrant box catalog](https://app.vagrantup.com/boxes/search) for a Vagrant box matching your use case. Here, a box can be undestood as a base image of an operating system environment.

First, create and enter a directory to be used with your virtual machine:

```
$ mkdir vm-tutorial && \
    cd vm-tutorial
```

Next, initialise your virtual machine. Please substitute the value of the `$VM` variable with a name of your Vagrant box (`debian/buster64` in this example).

<ul><b>IMPORTANT NOTE:</b> The Singularity community maintains <a href="https://app.vagrantup.com/boxes/search?page=1&provider=&q=sylabs&sort=downloads&utf8=✓">a set of Vagrant boxes</a> too. These boxes have Singularity software already included and ready to use.</ul>

```
$ export VM=debian/buster64 && \
    vagrant init $VM
```

Make sure to allocate enough memory for your virtual machine. This can be done by editing the `vb.memory` parameter in the corresponding Vagrantfile (Vagrant configuration file). This file is automatically created in you virtual machine's directory.

Next, issue the following commands to bring your virtual machine up:

```
$ vagrant up && \
    vagrant ssh
```

Lastly, install the required software in your VM, as if your operating system was Linux. Please follow instructions described in the ["Software requirements for automatic recomputation"](#software-requirements-for-automatic-recomputation) section above.


## Acknowledgements

This development was supported by European Union’s Horizon 2020 research and
innovation programme under grant agreement [Human Brain Project SGA3
(H2020-EU.3.1.5.3, grant no.
945539)](https://cordis.europa.eu/project/id/945539).
