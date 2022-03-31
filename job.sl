                                                                                                                  
#!/bin/bash

# Slurm submission script,
# GPU job
# CRIHAN v 1.00 - Jan 2017
# support@criann.fr

#shared ressources
##SBATCH --share


# Job name
#SBATCH -J "W_01"

# Batch output file
#SBATCH --output output/W.o%J

# Batch error file
#SBATCH --error output/W.e%J

#SBATCH --partition gpu_p100

#SBATCH --time 48:00:00
#SBATCH --gres gpu:1


#SBATCH --cpus-per-task 7

#SBATCH --mem 20000
# -----
#SBATCH --mail-type ALL
# User e-mail address
##SBATCH --mail-user vishnu.pradeep@esigelec.fr
# environments
# -----

module load python3-DL/3.8.5

# ---------------------------------


srun python3 ~/repos/WiCoNet/train.py


