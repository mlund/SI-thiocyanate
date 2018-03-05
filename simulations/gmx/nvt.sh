#!/bin/bash
module purge
module load GCC/5.4.0-2.26  OpenMPI/1.10.3
module load GROMACS/5.1.4-hybrid

for nmol in 300 400 600 800 
do
cd $nmol
gmx grompp -f ../nvt.mdp -c $nmol.gro -p ff_our.top -o nvt.tpr -n index.ndx -maxwarn 1
echo "#!/bin/bash
#SBATCH -p gpu
#SBATCH --exclusive
#SBATCH --gres=gpu:2
#SBATCH --mem-per-cpu=3100
#SBATCH -N 1
#SBATCH -A lu2017-2-5
#
# job time, change for what your job requires 
#SBATCH -t 72:00:00
# 
# job name
#SBATCH -J kscnb_$nmol
#
# filenames stdout and stderr - customise, include %j
#SBATCH -o nvt.out
#SBATCH -e nvt.err

cd "\$SLURM_SUBMIT_DIR"

module purge
module load GCC/5.4.0-2.26 CUDA/8.0.44 OpenMPI/2.0.1
module load GROMACS/2016-hybrid

gmx mdrun -deffnm nvt 
#gmx mdrun -cpi nvt.cpt -deffnm nvt -nsteps 50000000 -append 
" > nvt.sh
sbatch nvt.sh

cd ..
done
