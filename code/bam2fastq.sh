#! /usr/bin/bash

module load singularity
module load nextflow

nextflow run nf-core/bamtofastq \
    --input ./samplesheet.csv \
    --outdir ../../intermediate/ \
    --no_read_QC \
    --no_stats \
    -profile kaust