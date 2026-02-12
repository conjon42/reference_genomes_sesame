#! /usr/bin/bash

#SBATCH --time=2:00:00
#SBATCH --job-name=nf_head_genomeassembler
#SBATCH --partition=interactive # Partition to run the head job (or a dedicated 'head' queue if available)
#SBATCH --mem=6GB # Job memory request
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=johnsoc@kaust.edu.sa

module load singularity
module load nextflow

nextflow run nf-core/genomeassembler \
    -r dev \
    -profile test,kaust \
    -c ../hifiasm_amd_rome.config \
    --use_ref \
    --hifi \
    --assembler hifiasm \
    --scaffold_ragtag \

