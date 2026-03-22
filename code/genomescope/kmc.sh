#!/bin/bash
#SBATCH --job-name=kmc_count
#SBATCH --error=./logs/kmc_count_%j.err
#SBATCH --output=./logs/kmc_count_%j.out
#SBATCH --cpus-per-task=20
#SBATCH --mem=120G
#SBATCH --time=02:00:00
#SBATCH --partition=batch
#SBATCH --mail-type=ALL
#SBATCH --mail-user=conner.johnson@kaust.edu.sa

module load kmc

INPUT="/ibex/project/c2141/sesame/reference_genome_assembly/intermediate/reads/giza_other.fq.gz"
OUT_DIR="../../intermediate/kmer_counts"
OUT_PREFIX="$OUT_DIR/giza_k21"
KMC_TMP="./kmc_tmp_dir"
mkdir -p $KMC_TMP

# KMC flags:
# -k21 : k-mer size
# -t16 : 16 threads for KMC (leaving 4 for pigz)
# -m60 : max RAM in GB for KMC (leaves 4GB overhead for OS/pigz to prevent OOM)
# -fq  : forces KMC to read the input stream as FASTQ
# -ci1 : include k-mers that occur at least 1 time (i.e., all k-mers)

kmc -k21 -t20 -m64 -fq -ci1 -cs500000  $INPUT $OUT_PREFIX $KMC_TMP

echo "K-mer counting complete!"

kmc_tools transform ../../intermediate/kmer_counts/giza_k21 histogram ../../intermediate/kmer_counts/giza_k21.hist

rm -rf $KMC_TMP
