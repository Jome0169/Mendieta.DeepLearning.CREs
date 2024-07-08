#!/bin/bash
#SBATCH --job-name=Notebooks       # Job name
#SBATCH --partition=schmitz_p              # Partition (queue) name, i.e., highmem_p schmitz_hm_p
#SBATCH --ntasks=1                          # Run a single task	
#SBATCH --cpus-per-task=15                  # Number of CPU cores per task
#SBATCH --mem=180gb                          # Job memory request
#SBATCH --time=120:00:00                     # Time limit hrs:min:sec
#SBATCH --output=nb.log.out         # Standard output log
#SBATCH --error=nb.log.err          # Standard error log
#SBATCH --mail-type=END,FAIL                # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=john.mendieta@uga.edu   # Where to send mail
#SBATCH --export=NONE                       # do not load any env variables to compute node

cd $SLURM_SUBMIT_DIR
source /apps/lmod/lmod/init/zsh
ml purge 
ml Anaconda3
conda activate R.safe
ml JupyterLab


NOTEBOOKPORT=9500
IPUSED=$(hostname -i)
echo "NOTEBOOKPORT is " $NOTEBOOKPORT
echo "IPUSED is " $IPUSED
jupyter lab --port $NOTEBOOKPORT --ip=$IPUSED --no-browser
