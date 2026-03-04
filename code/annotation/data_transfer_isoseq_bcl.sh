#!/bin/bash

#SBATCH --time=01:00:00
#SBATCH --partition=batch
#SBATCH --mail-type=ALL
#SBATCH --mail-user=conner.johnson@kaust.edu.sa
#SBATCH --output=./logs/data_transfer.out
#SBATCH --error=./logs/data_transfer.err
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G

cp -a /biocorelab/BCLCustomers/polandja/Revio/r84180_20260225_104050/1_B01/ /ibex/project/c2141/sesame/reference_genome_assembly/data/isoseq