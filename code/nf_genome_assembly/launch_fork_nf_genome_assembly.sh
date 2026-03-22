#! /usr/bin/bash

#SBATCH --time=5-00:00:00
#SBATCH --job-name=nf_head_genomeassembler
#SBATCH --partition=interactive # Partition to run the head job (or a dedicated 'head' queue if available)
#SBATCH --mem=6GB # Job memory request
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=conner.johnson@kaust.edu.sa

module load singularity
module load nextflow

nextflow run conjon42/genomeassembler \
    -profile kaust \
    -c ./hifiasm.config \
    --input ./samplesheet.csv \
    --outdir ../../results/assembly \
    --use_ref \
    --hifi \
    --assembler hifiasm \
    --hifiasm_args "-l0 --hg-size 320m --primary" \
    --scaffold_ragtag \
    -resume
