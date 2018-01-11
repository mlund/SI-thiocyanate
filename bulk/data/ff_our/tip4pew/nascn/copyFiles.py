import shutil
from io import StringIO
from math import pi
import numpy as np
import os

concs = [0.5]

for conc in concs:
    concDir = str(conc)+'m'
    if not os.path.exists(concDir):
        os.mkdir(concDir)
    
    for i in np.arange(1,19,1):
        src='../../../tip4ew/75Å/nascn/q_s_-0.573_q_c_0.483_q_n_-0.91/sNa_0.255_eNa_0.28/conc_'+str(conc)+'_sS_0.383_eS_1.523_sC_0.335_eC_0.425_sN_0.37_eN_0.31/g_cc_'+str(i)
        dest=str(conc)+'m'
        shutil.copy(src,dest)
    	
        src='../../../tip4ew/75Å/nascn/q_s_-0.573_q_c_0.483_q_n_-0.91/sNa_0.255_eNa_0.28/conc_'+str(conc)+'_sS_0.383_eS_1.523_sC_0.335_eC_0.425_sN_0.37_eN_0.31/g_wc_'+str(i)
        dest=str(conc)+'m'
        shutil.copy(src,dest)

        src='../../../tip4ew/75Å/nascn/q_s_-0.573_q_c_0.483_q_n_-0.91/sNa_0.255_eNa_0.28/conc_'+str(conc)+'_sS_0.383_eS_1.523_sC_0.335_eC_0.425_sN_0.37_eN_0.31/r_'+str(i)
        dest=str(conc)+'m'
        shutil.copy(src,dest)

        src='../../../tip4ew/75Å/nascn/q_s_-0.573_q_c_0.483_q_n_-0.91/sNa_0.255_eNa_0.28/conc_'+str(conc)+'_sS_0.383_eS_1.523_sC_0.335_eC_0.425_sN_0.37_eN_0.31/rho_c_'+str(i)
        dest=str(conc)+'m'
        shutil.copy(src,dest)
    
        src='../../../tip4ew/75Å/nascn/q_s_-0.573_q_c_0.483_q_n_-0.91/sNa_0.255_eNa_0.28/conc_'+str(conc)+'_sS_0.383_eS_1.523_sC_0.335_eC_0.425_sN_0.37_eN_0.31/V_'+str(i)
        dest=str(conc)+'m'
        shutil.copy(src,dest)
