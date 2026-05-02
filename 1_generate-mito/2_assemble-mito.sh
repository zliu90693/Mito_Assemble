#!/bin/bash

sp_name=""

while getopts "n:" opt; do
    case $opt in
        n) sp_name=$OPTARG ;;
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

get_organelle_from_reads.py \
    -1 "./fastq/${sp_name}/${sp_name}.lite.1_1.fastq.gz" \
    -2 "./fastq/${sp_name}/${sp_name}.lite.1_2.fastq.gz" \
    -t 20 \
    -k 21,45,65,85,105 \
    -F animal_mt \
    -o "./mito-out/${sp_name}"