#!/bin/bash

# This script downloads fastq data from the GEO database for a list of accession numbers
# Usage: ./download_data.sh [-p] accession_list output_directory
# Optional flag -p indicates paired-end sequencing. If not provided, single-end sequencing is assumed.
# Accession list is a file containing a list of accession numbers, one per line.
# Output directory is the directory where the fastq files will be saved. If the directory does not exist, it will be created.

# check for the correct number of arguments
if [[ $# -lt 2 ]]; then
    echo "Usage: ./download_data.sh [-p] accession_list output_directory"
    exit 1
fi

# set default values
paired=false

# parse command line arguments
while getopts ":p" opt; do
  case ${opt} in
    p )
      paired=true
      ;;
    \? )
      echo "Usage: ./download_data.sh [-p] accession_list output_directory"
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

accession_list=$1
output_directory=$2

# check that the accession list file exists
if [[ ! -f $accession_list ]]; then
    echo "Accession list file not found: $accession_list"
    exit 1
fi

# create the output directory if it doesn't exist
mkdir -p $output_directory

# download the data for each accession number
while read accession; do
    if [[ $paired = true ]]; then
        fastq-dump --split-files --gzip $accession -O $output_directory
    else
        fastq-dump --gzip $accession -O $output_directory
    fi
done < $accession_list
