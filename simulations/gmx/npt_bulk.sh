module purge
module load GCC/5.4.0-2.26  OpenMPI/1.10.3
module load GROMACS/5.1.4-hybrid

for nmol in 10.0m 8.0m 7.0m 6.0m 5.0m 4.0m 3.0m 2.0m 1.0m 0.5m 
do
cd $nmol
gmx grompp -f ../npt.mdp -c min.gro -p topol.top -o npt.tpr -maxwarn 2

echo "#!/bin/bash
#SBATCH -p snic
#SBATCH --exclusive
#SBATCH -N 1
#SBATCH --ntasks-per-node=20
#SBATCH -A snic2017-1-48
#
# job time, change for what your job requires 
#SBATCH -t 1:00:00
# 
# job name
#SBATCH -J $nmol
#
# filenames stdout and stderr - customise, include %j
#SBATCH -o npt.out
#SBATCH -e npt.err

cd "\$SLURM_SUBMIT_DIR"

module purge
module load GCC/5.4.0-2.26  OpenMPI/1.10.3
module load GROMACS/5.1.4-hybrid

gmx mdrun -deffnm npt -v 
#gmx mdrun -cpi npt.cpt -nsteps 12000000 -s npt.tpr
#gmx mdrun -cpi npt.cpt -deffnm npt -nsteps 12000000 -append
" > npt.sh
sbatch npt.sh
cd ..
done
