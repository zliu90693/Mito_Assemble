#!/bin/bash

srr_id=""
sp_name=""

while getopts "s:n:" opt; do
    case $opt in
        s) srr_id=$OPTARG ;;
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

sra_path=$(srapath $srr_id)

# mkdir -p "./sra/${sp_name}"
aria2c -x 16 -s 16 -o "./sra/${sp_name}.lite.1" $sra_path

mkdir -p "./fastq/${sp_name}"
# kingfisher get -r "${srr_id}" -m ena-ftp aws-http prefetch
fasterq-dump "./sra/${sp_name}.lite.1" \
    --split-files \
    --threads 8 \
    --outdir "./fastq/${sp_name}" \
    --temp "./fastq/${sp_name}/.tmp" \
    --progress
pigz -p 16 "./fastq/${sp_name}/"*.fastq