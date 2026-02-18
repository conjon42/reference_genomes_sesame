#!/bin/bash
#SBATCH --job-name=tidk_find
#SBATCH --mem=16G
#SBATCH --cpus-per-task=8
#SBATCH --output=./logs/find_%j.out
#SBATCH --error=./logs/find_%j.err
#SBATCH --time=1:00:00
#SBATCH --partition=batch
#SBATCH --mail-type=ALL
#SBATCH --mail-user=conner.johnson@kaust.edu.sa

source /ibex/user/johnsoc/miniforge/etc/profile.d/conda.sh
conda activate tidk

tidk build

mkdir ./tmp
gunzip -c /ibex/project/c2141/sesame/reference_genome_assembly/results/2OW4BC1lvLRFRF_scaffold/giza/assembly/hifiasm/fasta/giza.p_ctg.fa.gz > ./tmp/giza_uncompressed.fa

tidk find \
./tmp/giza_uncompressed.fa \
--clade Lamiales \
--output ./tidk_find_telomeres_giza_p_ctg \
--dir /ibex/project/c2141/sesame/reference_genome_assembly/results/2OW4BC1lvLRFRF_scaffold/giza/telomeres \
--log \

rm -rf ./tmp
