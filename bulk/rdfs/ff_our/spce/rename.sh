#!/bin/sh



for i in `seq 1 10`
do
	echo hey
done

concs='0.5 1.0 1.5 2.0 2.5 3.0'

cations='na k'

anions='scn i cl'

block_range=`seq 1 18`

for cation in $cations 
do
	
	for anion in $anions
	do

		for conc in $concs
		do
			
			for block in $block_range
			do
			
			rm $cation$anion/$conc'm'/g_+-_$block  
			mv $cation$anion/$conc'm'/g_+-_new_$block $cation$anion/$conc'm'/g_+-_$block 
			
			done

		done

	done

done	
		

