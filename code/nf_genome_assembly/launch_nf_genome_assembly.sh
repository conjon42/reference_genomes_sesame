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
    --lima \
    --pacbio_primers ../../data/20260114_bcl_hifi_release/2_A01/common/barcodes.fasta \
    --assembler hifiasm \
    --hifiasm_args "-l0 --hg-size 320m --primary" \
    --scaffold_ragtag
