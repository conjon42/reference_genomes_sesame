#! /usr/bin/bash
#SBATCH --job-name=genome_assembly
#SBATCH --error=result.err
#SBATCH --ntasks=1          # Run a single task
#SBATCH --cpus-per-task=2   # Number of CPU cores per task
#SBATCH --mem=4G            # Total memory (4GB)
#SBATCH --time=24:00:00     # Time limit hrs:min:sec

module load singularity
module load nextflow

nextflow run nf-core/genomeassembler \
    -r dev \
    -profile kaust \
    --input samplesheet.csv \
    --outdir ../../results/asssembly \
    --use_ref \
    --hifi \
    --lima \
    --pacbio_primers ../../data/20260114_bcl_hifi_release/2_A01/common/ \
    --assembler hifiasm \
    --hifiasm_args "-l0 --hg-size 320m --primary" \
    --scaffold_ragtag \
