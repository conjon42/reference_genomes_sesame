#!/bin/bash
#SBATCH --job-name=tidk_plot
#SBATCH --mem=16G
#SBATCH --cpus-per-task=8
#SBATCH --output=./logs/plot_%j.out
#SBATCH --error=./logs/plot_%j.err
#SBATCH --time=0:2:00
#SBATCH --partition=batch
#SBATCH --mail-type=ALL
#SBATCH --mail-user=conner.johnson@kaust.edu.sa

source /ibex/user/johnsoc/miniforge/etc/profile.d/conda.sh
conda activate tidk

#cd /ibex/project/c2141/sesame/reference_genome_assembly/results/2OW4BC1lvLRFRF_scaffold/giza/telomeres/


tidk plot \
--tsv /ibex/project/c2141/sesame/reference_genome_assembly/results/2OW4BC1lvLRFRF_scaffold/giza/telomeres/tidk_find_telomeres_giza_p_ctg_telomeric_repeat_windows.tsv \
--output /ibex/project/c2141/sesame/reference_genome_assembly/results/2OW4BC1lvLRFRF_scaffold/giza/telomeres/tidk_plot

