# A Molecular Forcefield for Thiocyanate Anions in Water and at Interfaces

### Layout

- `bulk/` OpenMM MD simulations of aquous salt solutions and Kirkwood-Buff analysis
- `airwater/` Gromacs MD simulations of air-water salt solutions and surface tension analysis

### Usage

To open this Notebook, install python via [(Mini)conda](https://www.continuum.io/downloads) and make sure all required packages are loaded
by issuing the following terminal commands,

    conda env create -f environment.yml
    source activate thiocyanate
    jupyter-notebook
