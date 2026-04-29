#!/bin/bash

cd /home/liuzhiyu/Projects/neo_caste/Mito_Assemble/3_combine-gtf/annotate_out_gff
for path in $(find ../../2_annotate-mito -name "*.gff"); do
    sp_name=$(basename $(dirname "$path"))
    ln -sf $path "${sp_name}.gff"
    agat_convert_sp_gff2gtf.pl --gff "${sp_name}.gff" --out "../annotate_out_gtf/${sp_name}.gtf" 
done