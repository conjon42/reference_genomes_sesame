#!/bin/bash
#SBATCH --time=01:00:00
#SBATCH --partition=batch
#SBATCH --mail-type=ALL
#SBATCH --mail-user=conner.johnson@kaust.edu.sa
#SBATCH --output=./logs/cramino.out
#SBATCH --error=./logs/cramino.err
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G

source /ibex/user/johnsoc/miniforge/etc/profile.d/conda.sh
conda activate cramino

cramino -t 4 ../../data/isoseq/1_B01/common/m84180_260225_125154.hifi_reads.bam --ubam 

cramino -t 4 ../../data/isoseq/1_B01//version_01/sesamum_indicum_giza_v2_leaf_Sesamumindicum/sesamum_indicum_giza_v2_leaf_Sesamumindicum.hifi_reads.bam --ubam 

