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

mkdir -p "./fastq/${sp_name}"
cd "./fastq/${sp_name}"
kingfisher get -r "${srr_id}" -m ena-ftp aws-http prefetch