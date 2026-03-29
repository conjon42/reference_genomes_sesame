#!/bin/bash
#SBATCH --job-name=rasusa_subsample
#SBATCH --error=./logs/rasusa_subsample_%j.err
#SBATCH --output=./logs/rasusa_subsample_%j.out
#SBATCH --cpus-per-task=12
#SBATCH --mem=4G
#SBATCH --time=00:30:00
#SBATCH --partition=batch
#SBATCH --mail-type=ALL
#SBATCH --mail-user=conner.johnson@kaust.edu.sa

source /ibex/user/johnsoc/miniforge/etc/profile.d/conda.sh
conda activate rasusa

root="$(git rev-parse --show-toplevel)"

mkdir -p ${root}/intermediate/rasusa_subsamples
input=${root}/intermediate/reads/giza_other.fq.gz

rasusa reads \
--genome-size 300mb  \
--coverage 20 \
-o ${root}/intermediate/rasusa_subsamples/giza_20x_subsampled.fq.gz \
${input}