[![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/mlund/SI-thiocyanate/master)

# A Molecular Forcefield for Thiocyanate Anions in Water and at Interfaces

This repository contains [Jupyter](http://jupyter.org) Notebooks and simulation data for reproducing the work of the scientific paper _Specific Cation Effects on SCN<sup>-</sup> in Bulk Solution and at the Air–Water Interface_, [DOI: 10.1021/acs.jpcb.8b02303](http://dx.doi.org/10.1021/acs.jpcb.8b02303).

### Layout

- `notebook.ipynb` Jupyter Notebook to analyze all simulation data and generate plots
- `notebook.html` Jupyter Notebook in HTML format 
- `simulations/openmm/OpenMM.ipynb` Jupyter Notebook to perform MD simulations of bulk salt solutions using OpenMM
- `simulations/gmx/` All GROMACS files needed to perform MD simulations of air–salt solution interfaces  
- `dft/` Jupyter Notebook to perform quantum-chemical calculations using MOLCAS
- `bulk/` OpenMM and GROMACS MD simulation data on aqueous salt solutions and Kirkwood-Buff analysis
- `interface/` Gromacs MD simulation data on air–salt solution interfaces and surface tension analysis

### Usage

To open the Notebooks, install python via [Miniconda](https://conda.io/miniconda.html) and make sure all required packages are loaded
by issuing the following terminal commands,

```bash
    conda env create -f environment.yml
    source activate thiocyanate
    jupyter-notebook
```
