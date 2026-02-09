#! /usr/bin/bash

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
    --scaffold_ragtag
    -preview
