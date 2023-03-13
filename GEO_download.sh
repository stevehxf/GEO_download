#!/bin/bash

# usage function
function usage {
    echo "Usage: $0 [-p] accession_list output_directory"
    echo "  -p: flag to indicate paired-end sequencing (optional)"
    echo "  accession_list: file containing a list of accession numbers, one per line"
    echo "  output_directory: directory where you want to save the fastq files"
    exit 1
}

# check if the correct number of arguments was provided
if [ $# -lt 2 ]; then
    usage
fi

# default to single-end sequencing
paired=false

# parse command line arguments
while getopts "hp" opt; do
    case ${opt} in
        h)
            usage
            ;;
        p)
            paired=true
            ;;
        \?)
            usage
            ;;
    esac
done

# remove the options from the positional parameters
shift $((OPTIND-1))

# set the accessions file to the first positional parameter
accessions_file=$1

# check if the accessions file was provided
if [ -z "$accessions_file" ]; then
    usage
fi

# check if the accessions file exists
if [ ! -f "$accessions_file" ]; then
    echo "Error: File $accessions_file does not exist"
    exit 1
fi

# set the output directory to the second positional parameter
output_dir=$2

# check if the output directory was provided
if [ -z "$output_dir" ]; then
    usage
fi

# check if the output directory exists, if not create it
if [ ! -d "$output_dir" ]; then
    mkdir -p "$output_dir"
fi

# change to output directory
cd "$output_dir"

# loop through each accession number in the file and download the fastq data
while read accession_number; do
    echo "Downloading ${accession_number}..."
    if [ "$paired" = true ]; then
        fastq-dump --split-files ${accession_number}
    else
        fastq-dump ${accession_number}
    fi
done < "$accessions_file"
