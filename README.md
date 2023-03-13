# Bash Script for Downloading Next Generation Sequencing (NGS) Data from the GEO Database 

## Purpose

This bash script is designed to download fastq data from the Gene Expression Omnibus (GEO) database for a list of accession numbers. The script uses the SRA toolkit's fastq-dump command to download the raw fastq data for each accession number in the list. The script can handle both single-end and paired-end sequencing data.

## Usage
### To use the script, follow these steps:

1. Save the script as a file on your local machine (e.g., download_data.sh).
2. Make the script executable by running chmod +x download_data.sh in the terminal.
3. Open a terminal window and navigate to the directory where the script is located.
4. Run the script by typing ./download_data.sh [-p] accession_list output_directory in the terminal.

### The script takes the following command line arguments:

* `-p`: (optional) flag to indicate paired-end sequencing. If this flag is provided, the script will download the paired-end fastq data. If this flag is not provided, the script will download the single-end fastq data.
* `accession_list`: file containing a list of accession numbers, one per line. This file is required.
* `output_directory`: directory where you want to save the fastq files. This directory is required. If the directory does not exist, the script will create it.

### Here is an example command to run the script:
`./download_data.sh -p accession_list.txt /path/to/output/directory`

This command will download the paired-end fastq data for each accession number in the file `accession_list.txt`, and save the data to the `/path/to/output/directory` directory.
