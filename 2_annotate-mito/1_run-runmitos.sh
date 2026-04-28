#!/bin/bash

for sp_fasta in ./unannotated_mito_fasta/* ; do
    sp_name=$(basename $sp_fasta)
    sp_name="${sp_name%.fasta}"
    outdir="./annotate_out/${sp_name}"
    mkdir -p $outdir
    runmitos -i $sp_fasta -c 5 -R ./mitos2_ref_89m -r refseq89m -o $outdir --intron 0 --oril 0 --orih 0 --best --noplots
done