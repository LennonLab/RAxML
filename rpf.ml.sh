#!/bin/bash
#PBS -k o
#PBS -l nodes=2:ppn=8,vmem=100gb,walltime=24:00:00
#PBS -M lennonj@indiana.edu
#PBS -m abe
#PBS -j oe
#PBS -N RpfTree

# version 8.0.26
module load raxml/gnu/8.2.11

# cd into the directory with your alignment

# cd /N/dc2/projects/Lennon_Sequences/Rpf

raxmlHPC-PTHREADS -T 4 -f a -m GTRGAMMA -p 12345 -x 12345 -o Methanosarcina -# autoMRE \
    -s /N/dc2/projects/Lennon_Sequences/Rpf/Rpf.16S.tree.afa \
    -n rpf.ml -w /N/dc2/projects/Lennon_Sequences/Rpf/

# -T = number of threads
# -f = specifies bootstrapping algorithm with ML generating tree at same time
# -m = substitution model, generalized time reversible gamma
# -p = starts tree randomly
# -x = starts tree randomly
# -o = outgroup (name after fasta entry)
# -#  = determines number of bootstrap replicates
# -s = aligned fasta file to be analyzed
# -n = name of output file
