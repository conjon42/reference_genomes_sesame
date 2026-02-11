#! /usr/bin/bash

#SBATCH --time=12-00:00:00
#SBATCH --job-name=nf_head_genomeassembler
#SBATCH --memory=4GB
#SBATCH --partition=interactive # Partition to run the head job (or a dedicated 'head' queue if available)
#SBATCH --mem=4GB # Job memory request
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mail-type=ALL
#SBATCH --mail-user=johnsoc@kaust.edu.sa

module load singularity
module load nextflow

nextflow run nf-core/genomeassembler \
    -r dev \
    -profile kaust \
    --input ./samplesheet.csv \
    --outdir ../../results/asssembly \
    --use_ref \
    --hifi \
    --assembler hifiasm \
    --hifiasm_args "-l0 --hg-size 320m --primary" \
    --scaffold_ragtag \
    -resume
