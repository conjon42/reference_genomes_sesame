#!/bin/bash
#SBATCH --job-name=purgedups
#SBATCH --mem=64G
#SBATCH --cpus-per-task=48
#SBATCH --output=./logs/purgedups_%j.out
#SBATCH --error=./logs/purgedups_%j.err
#SBATCH --time=6:00:00
#SBATCH --partition=batch
#SBATCH --mail-type=ALL
#SBATCH --mail-user=conner.johnson@kaust.edu.sa

conda activate purge_dups

pb_list=$(ls /ibex/project/c2141/sesame/reference_genome_assembly/intermediate/reads/giza_other.fq.gz)
pri_asm=../../intermediate/2OW4BC1lvLRFRF_scaffold/giza/giza.combined.fasta

for i in $pb_list
do
	minimap2 -xmap-hifi $pri_asm $i | gzip -c - > $i.paf.gz
done

pbcstat *.paf.gz # (produces PB.base.cov and PB.stat files)
calcuts PB.stat > cutoffs 2>calcults.log

# Split assembly for faster mapping (standard purge_dups step)
split_fa $pri_asm > $pri_asm.split
# Map the split assembly to itself
minimap2 -xasm5 -DP $pri_asm.split $pri_asm.split | gzip -c - > $pri_asm.split.self.paf.gz

purge_dups -2 -T cutoffs -c PB.base.cov $pri_asm.split.self.paf.gz > dups.bed 2> purge_dups.log
get_seqs -e dups.bed $pri_asm > purged.fa

