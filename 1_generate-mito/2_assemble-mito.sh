#!/bin/bash

sp_name=""
fastq_read_length=151

while getopts "n:r:l:" opt; do
    case $opt in
        n) sp_name=$OPTARG ;;
        l) fastq_read_length=$OPTARG ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Error: Option -$OPTARG requires a parameter value." >&2
            exit 1
            ;;
    esac
done

mkdir -p "./mito-out/${sp_name}"

# get_organelle_from_reads.py \
#     -1 "./fastq/${sp_name}/${sp_name}.lite.1_1.fastq.gz" \
#     -2 "./fastq/${sp_name}/${sp_name}.lite.1_2.fastq.gz" \
#     -t 20 \
#     -k 21,45,65,85,105 \
#     -F animal_mt \
#     -s "./ref-mito/${ref_name}.fasta" \
#     -o "./mito-out/${sp_name}" \
#     --overwrite 

mitoz all  \
    --outprefix "${sp_name}" \
    --thread_number 20 \
    --clade Arthropoda \
    --genetic_code 5 \
    --species_name "${sp_name}" \
    --fq1 "./fastq/${sp_name}/${sp_name}.lite.1_1.fastq.gz" \
    --fq2 "./fastq/${sp_name}/${sp_name}.lite.1_2.fastq.gz" \
    --fastq_read_length $fastq_read_length \
    --data_size_for_mt_assembly 3,0 \
    --assembler megahit \
    --kmers_megahit 59 79 99 \
    --memory 50 \
    --requiring_taxa Arthropoda \
    --workdir "./mito-out/${sp_name}"