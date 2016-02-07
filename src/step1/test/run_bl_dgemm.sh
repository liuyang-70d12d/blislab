#!/bin/bash
#export DYLD_LIBRARY_PATH=/opt/intel/lib:/opt/intel/mkl/lib

#Single Thread
export KMP_AFFINITY=compact
export OMP_NUM_THREADS=1
export BLISGEMM_IC_NT=1
kmax=1100
kstep=15
echo "run_step1_st=["
for (( k=4; k<kmax; k+=kstep ))
do
    ./test_bl_dgemm.x     $k $k $k
done
echo "];"


#Multi Thread
export KMP_AFFINITY=compact
export OMP_NUM_THREADS=10
export BLISGEMM_IC_NT=10
#Single Thread
kmax=5000
kstep=31
echo "run_step1_mt=["
for (( k=4; k<kmax; k+=kstep ))
do
    ./test_bl_dgemm.x     $k $k $k
done
echo "];"

