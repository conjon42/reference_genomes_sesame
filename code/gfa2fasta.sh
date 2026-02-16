#!/bin/bash
#SBATCH --job-name=gfa2fasta
#SBATCH --mem=16G
#SBATCH --cpus-per-task=4
#SBATCH --output=./logs/gfa2fasta_%j.out
#SBATCH --error=./logs/gfa2fasta_%j.err
#SBATCH --time=00:10:00
#SBATCH --partition=batch
#SBATCH --mail-type=ALL
#SBATCH --mail-user=conner.johnson@kaust.edu.sa

module load gfatools
mkdir -p ../intermediate/2OW4BC1lvLRFRF_scaffold/giza
gfatools gfa2fa ../results/2OW4BC1lvLRFRF_scaffold/giza/assembly/hifiasm/giza.p_ctg.gfa > ../intermediate/2OW4BC1lvLRFRF_scaffold/giza/giza.p_ctg.fasta
gfatools gfa2fa ../results/2OW4BC1lvLRFRF_scaffold/giza/assembly/hifiasm/giza.a_ctg.gfa > ../intermediate/2OW4BC1lvLRFRF_scaffold/giza/giza.a_ctg.fasta