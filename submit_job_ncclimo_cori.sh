#!/bin/bash -l
#SBATCH -q debug
#SBATCH -N 9
#SBATCH -t 00:30:00
#SBATCH -J benchmark_ncclimo
#SBATCH -o my_job.o%j
#SBATCH -A m2467
#SBATCH --constraint=knl


cd /global/homes/m/minxu/scratch/tmp/test_ncclimo
srun -N 1 ./run_gen_ts.sh 1 &
srun -N 1 ./run_gen_ts.sh 2 &
srun -N 1 ./run_gen_ts.sh 3 &
srun -N 1 ./run_gen_ts.sh 4 &
srun -N 1 ./run_gen_ts.sh 5 &
srun -N 1 ./run_gen_ts.sh 6 &
srun -N 1 ./run_gen_ts.sh 7 &
srun -N 1 ./run_gen_ts.sh 8 &
srun -N 1 ./run_gen_ts.sh 9 &
wait
