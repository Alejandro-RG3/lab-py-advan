#!/bin/bash
#SBATCH -p hpc-bio-mendel
#SBATCH --chdir=/home/alumno19/lab-py-advan/lab-py-advan
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH -J python

module load anaconda/2025.06

number=$1
echo "Utilizando numero $number"

for cores in 1 2 4 8
do
  echo "Utilizando $cores núcleos"
  export OMP_NUM_THREADS=$cores
  export NUMBA_NUM_THREADS=$cores

  ipython primes-par-alumno19.ipynb $number $cores
done

module unload anaconda/2025.06
