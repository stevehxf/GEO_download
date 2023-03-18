# Bash Script for Downloading raw data from the GEO database 


## Purpose

This bash script is designed to download fastq data from the Gene Expression Omnibus (GEO) database for a list of accession numbers. The script uses the SRA toolkit's `fastq-dum` command to download the raw fastq data for each accession number in the list. The script can handle both single-end and paired-end sequencing data. The output fastq files are gzipped.

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
`bash ./download_data.sh -p accession_list.txt /path/to/output/directory`

This command will download the paired-end fastq data for each accession number in the file `accession_list.txt`, gzip the output fastq files, and save the data to the `/path/to/output/directory` directory.

## Output

The script will download the fastq data for each accession number in the list and save the data to the specified output directory. The output fastq files will be gzipped.

For each accession number, the script will create two fastq files if the data is paired-end sequencing: `<accession>_1.fastq.gz` and `<accession>_2.fastq.gz`. If the data is single-end sequencing, the script will create one fastq file: `<accession>.fastq.gz`.

## Troubleshooting

If you encounter any issues while running the script, here are some potential troubleshooting steps:

* **Accession list file not found**: Check that the accession list file is located in the specified directory and that the file name is correct. If the file name or location is incorrect, update the command to point to the correct file.
* **SRA toolkit not installed**: Make sure that the SRA toolkit is installed on your system and that the fastq-dump command is available in your terminal. If the command is not available, you may need to install the SRA toolkit or update your system's PATH variable.
* **Download errors**: If the script encounters an error while downloading the fastq data, it may fail to download some or all of the data. Check the error message for more information on the cause of the error. You can also try re-running the script or downloading the data manually from the GEO database.
