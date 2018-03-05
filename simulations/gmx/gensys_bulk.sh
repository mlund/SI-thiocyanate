module purge
module load GCC/5.4.0-2.26 CUDA/8.0.44 OpenMPI/2.0.1
module load GROMACS/2016-hybrid

for nmol in 553 660 758 848 930 1080
do
mkdir $nmol
cp topol.top $nmol
cd $nmol
gmx insert-molecules -ci ../top/SCN.gro -o scn.pdb -nmol $nmol -box 6.63339 6.63339 6.63339
printf "SCN               %d\n" $nmol >> topol.top
gmx solvate -cp scn.pdb -o scnwat.pdb -p topol.top -cs 
gmx grompp -f ../min.mdp -c scnwat.pdb -p topol.top -o min.tpr -maxwarn 2
echo "SOL" | gmx genion -s min.tpr -o min.pdb -p topol.top -pname K_d -np $nmol -rmin 0.2
cd ..
done

mv 553 4.0m 
mv 660 5.0m
mv 758 6.0m
mv 848 7.0m
mv 930 8.0m
mv 1080 10.0m