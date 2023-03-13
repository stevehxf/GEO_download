#!/bin/bash

# usage function
function usage {
    echo "Usage: $0 [-p] accession_list"
    echo "  -p: flag to indicate paired-end sequencing (optional)"
    echo "  accession_list: file containing a list of accession numbers, one per line"
    exit 1
}

# check if the correct number of arguments was provided
if [ $# -lt 1 ]; then
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

# change to directory where you want to save the data
cd /path/to/data/directory/

# loop through each accession number in the file and download the fastq data
while read accession_number; do
    echo "Downloading ${accession_number}..."
    if [ "$paired" = true ]; then
        fastq-dump --split-files ${accession_number}
    else
        fastq-dump ${accession_number}
    fi
done < "$accessions_file"
