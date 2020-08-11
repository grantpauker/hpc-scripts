#!/usr/bin/env bash
#$ -q free*
#$ -N ::FILENAME::
#$ -S /bin/bash
#$ -pe openmp ::CORES::
#$ -l h_rt=::HOURS:::00:00
#$ -ckpt restart
 
module load openmpi-4.0.1/6.4.0+ucx
 
mkdir /scratch/::USER::/
mkdir /scratch/::USER::/::FILENAME::

cp ::XYZ:: /scratch/::USER::/::FILENAME::
cp ::GBW:: /scratch/::USER::/::FILENAME::
cp ::HESS:: /scratch/::USER::/::FILENAME::
cp ::FILENAME::.inp /scratch/::USER::/::FILENAME::

cd /scratch/::USER::/::FILENAME::

echo "Job begins"
echo $HOSTNAME
date
/usr/bin/time -v /share/crsp/lab/rjnielse/share/source/orca_4_2_0_linux_x86-64_openmpi314/orca ::FILENAME::.inp > ::PWD::/::FILENAME::.out
 
cp -p *out ::PWD::
cp -p *hess ::PWD::
cp -p *trj* ::PWD::
cp -p *xyz ::PWD::
cp -p *gbw ::PWD::
cp -p *nat ::PWD::
cp -p *erp ::PWD::
 
rm -R /scratch/::USER::/::FILENAME::
