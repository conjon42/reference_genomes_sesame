#!/bin/bash
#SBATCH --job-name=compleasm
#SBATCH --mem=32G
#SBATCH --cpus-per-task=32
#SBATCH --output=./logs/compleasm_%j.out
#SBATCH --error=./logs/compleasm_%j.err
#SBATCH --time=2:00:00
#SBATCH --partition=batch
#SBATCH --mail-type=ALL
#SBATCH --mail-user=conner.johnson@kaust.edu.sa


source /ibex/user/johnsoc/miniforge/etc/profile.d/conda.sh
conda activate compleasm

mkdir ./tmp
gunzip -c /ibex/project/c2141/sesame/reference_genome_assembly/results/2OW4BC1lvLRFRF_scaffold/giza/assembly/hifiasm/fasta/giza.p_ctg.fa.gz > ./tmp/giza_uncompressed.fa

compleasm run \
-a ./tmp/giza_uncompressed.fa \
-o ../../results/2OW4BC1lvLRFRF_scaffold/giza/QC/compleasm/viridiplantae/ \
-l viridiplantae \
--odb odb12 \
-t 32 \
-L /ibex/user/johnsoc/busco_dbs

compleasm run \
-a ./tmp/giza_uncompressed.fa \
-o ../../results/2OW4BC1lvLRFRF_scaffold/giza/QC/compleasm/lamiales/ \
-l lamiales \
--odb odb12 \
-t 32 \
-L /ibex/user/johnsoc/busco_dbs

compleasm run \
-a ./tmp/giza_uncompressed.fa \
-o ../../results/2OW4BC1lvLRFRF_scaffold/giza/QC/compleasm/eudicotyledons/ \
-l eudicotyledons \
--odb odb12 \
-t 32 \
-L /ibex/user/johnsoc/busco_dbs

compleasm run \
-a ./tmp/giza_uncompressed.fa \
-o ../../results/2OW4BC1lvLRFRF_scaffold/giza/QC/compleasm/embryophyta/ \
-l embryophyta \
--odb odb12 \
-t 32 \
-L /ibex/user/johnsoc/busco_dbs

rm -rf ./tmp