#!/bin/bash -e

#SBATCH --account=vuw03073                      #Type the project code you want to use for this analyis		 $
#SBATCH --job-name=variability_dunedin          #This willl be the name appear on the queue			 $
#SBATCH --mem=50G                               #Amount of memory you need                                       $
#SBATCH --cpus-per-task=2                       #Amount of CPUs (logical)                                        $
#SBATCH --time=24:00:00                         #Duration dd-hh:mm:ss                                            $
#SBATCH --output=slurmOut/variability_dunedin.%j.txt    #Name of the output file                                 $
#SBATCH --mail-type=ALL                         #This will send you an email when the STARTS and ENDS		 $
#SBATCH --mail-user=calquigs@gmail.com          #Enter your email address.                                       $
#SBATCH --profile=task

#SBATCH --export NONE

export SLURM_EXPORT_ENV=ALL

#purging any modules/software loaded in the background prior to submitting script.(recommended)
module purge


#Load the required module for analysis/simulation.Always assign the version for better reproducibility

module load Miniconda3
source activate opendrift_simon

python variability_test_dunedin_customout.py

