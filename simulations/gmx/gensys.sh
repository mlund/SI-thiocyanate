module purge
module load GCC/5.4.0-2.26
module load OpenMPI/1.10.3
module load Boost/1.61.0
module load FFTW/3.3.4
module load CUDA/8.0.44

for nmol in 447  596  894  1192
do
mkdir $nmol
cp ff_our.top $nmol
cp min.mdp $nmol
cp nvt.mdp $nmol
cd $nmol
gmx insert-molecules -ci ../ff_our/SCN.gro -o scn.pdb -nmol $nmol -box 5.5 5.5 18.0
printf "SCN               %d\n" $nmol >> ff_our.top

gmx solvate -cp scn.pdb -o scnwat.pdb -p ff_our.top -cs -box 5.5 5.5 18.0
gmx grompp -f min.mdp -c scnwat.pdb -p ff_our.top -o min.tpr -maxwarn 2
echo "SOL" | gmx genion -s min.tpr -o min.pdb -p ff_our.top -pname NA_d -np $nmol -rmin 0.2
gmx editconf -f min.pdb -box 5.5 5.5 120.0 -o min.pdb
gmx grompp -f min.mdp -c min.pdb -p ff_our.top -o min.tpr -maxwarn 2

echo "#!/bin/bash
#SBATCH -p gpu
#SBATCH --exclusive
#SBATCH --gres=gpu:2
#SBATCH --mem-per-cpu=3100
#SBATCH -N 1
#SBATCH -A lu2017-2-5
#
#SBATCH -t 0:20:00
#SBATCH -J $nmol
#SBATCH -e min.err

cd "\$SLURM_SUBMIT_DIR"

module purge
module load GCC/5.4.0-2.26
module load OpenMPI/1.10.3
module load Boost/1.61.0
module load FFTW/3.3.4
module load CUDA/8.0.44

gmx mdrun -deffnm min -ntomp 1

" > min.sh
sbatch min.sh
cd ..
done
