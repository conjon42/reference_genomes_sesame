#!/bin/bash
#SBATCH --job-name=tidk
#SBATCH --mem=16G
#SBATCH --cpus-per-task=8
#SBATCH --output=./logs/tidk_%j.out
#SBATCH --error=./logs/tidk_%j.err
#SBATCH --time=1:00:00
#SBATCH --partition=batch
#SBATCH --mail-type=ALL
#SBATCH --mail-user=conner.johnson@kaust.edu.sa

source /ibex/user/johnsoc/miniforge/etc/profile.d/conda.sh
conda activate tidk

tidk explore \
--input /ibex/project/c2141/sesame/reference_genome_assembly/results/2OW4BC1lvLRFRF_scaffold/giza/assembly/hifiasm/fasta/giza.p_ctg.fa.gz \
--minimum 5 \
--maximum 30 \
--distance 0.5 \
--log \
--verbose