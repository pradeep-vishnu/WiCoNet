#!/bin/bash

# Slurm submission script, 
# GPU job 
# CRIHAN v 1.00 - Jan 2017 
# support@criann.fr

#shared ressources
##SBATCH --share


# Job name
#SBATCH -J "Trial_Map"

# Batch output file
#SBATCH --output output/GSV.o%J

# Batch error file
#SBATCH --error output/GSV.e%J

#SBATCH --partition gpu_k80

#SBATCH --time 48:00:00
#SBATCH --gres gpu:2


#SBATCH --cpus-per-task 4

#SBATCH --mem 20000
# -----
#SBATCH --mail-type ALL
# User e-mail address
##SBATCH --mail-user vishnu.pradeep@esigelec.fr
# environments
# -----

module load python3-DL/3.8.5

# ---------------------------------


cp -ar PyTorch-ENet  $LOCAL_WORK_DIR
cd $LOCAL_WORK_DIR
echo Working directory : $PWD

#add wanted options on the next line
srun python3 ~/repos/WiCoNet/eval.py

# Move output data to target directory
mv *.pth *.png $SLURM_SUBMIT_DIR/output/

sacct --format=AllocCPUs,AveCPU,MaxRSS,MaxVMSize,JobName -j $SLURM_JOB_ID
