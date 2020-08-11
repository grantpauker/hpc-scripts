#!/usr/bin/env bash
#$ -q free*
#$ -N ::FILENAME::
#$ -S /bin/bash
#$ -pe openmp ::CORES::
#$ -l h_rt=::HOURS:::00:00
#$ -ckpt restart
 
module load openmpi-4.0.1/6.4.0+ucx
 
mkdir /scratch/$USER/
mkdir /scratch/$USER/::FILENAME::

cp ::XYZ:: /scratch/$USER/::FILENAME::
cp ::GBW:: /scratch/$USER/::FILENAME::
cp ::HESS:: /scratch/$USER/::FILENAME::
cp ::FILENAME::.inp /scratch/$USER/::FILENAME::

cd /scratch/$USER/::FILENAME::

echo "Job begins"
echo $HOSTNAME
date
/usr/bin/time -v /share/crsp/lab/rjnielse/share/source/orca_4_2_0_linux_x86-64_openmpi314/orca ::FILENAME::.inp > /home/$USER/::FILENAME::.out
 
cp -p *out /home/$USER
cp -p *hess /home/$USER
cp -p *trj* /home/$USER
cp -p *xyz /home/$USER
cp -p *gbw /home/$USER
cp -p *nat /home/$USER
cp -p *erp /home/$USER
 
rm -R /scratch/$USER/::FILENAME::
