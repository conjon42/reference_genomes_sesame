#!/bin/bash
#SBATCH --job-name=tidk_search
#SBATCH --mem=16G
#SBATCH --cpus-per-task=8
#SBATCH --output=./logs/search_%j.out
#SBATCH --error=./logs/search_%j.err
#SBATCH --time=0:05:00
#SBATCH --partition=batch
#SBATCH --mail-type=ALL
#SBATCH --mail-user=conner.johnson@kaust.edu.sa

source /ibex/user/johnsoc/miniforge/etc/profile.d/conda.sh
conda activate tidk


mkdir ./tmp
gunzip -c /ibex/project/c2141/sesame/reference_genome_assembly/results/2OW4BC1lvLRFRF_scaffold/giza/assembly/hifiasm/fasta/giza.p_ctg.fa.gz > ./tmp/giza_uncompressed.fa

tidk search \
./tmp/giza_uncompressed.fa \
--string AAACCCT \
--window 10000 \
--output tidk_search_AAACCCT_giza_p_ctg \
--dir /ibex/project/c2141/sesame/reference_genome_assembly/results/2OW4BC1lvLRFRF_scaffold/giza/telomeres \
--extension bedgraph \
--log \

rm -rf ./tmp
