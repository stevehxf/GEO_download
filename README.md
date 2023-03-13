# GEO_download
A script to automatically download FASTQ data from GEO database.

To run the script, save it as a file (e.g., GEO_download.sh) and make it executable by running chmod +x download_data.sh in the terminal. Then, run the script by typing ./download_data.sh [-p] accession_list.txt in the terminal. The script will download the fastq data for each accession number in the list to the directory you specified. If the -p flag is provided, the script will download the paired-end fastq data.

If you run the script with the -h or --help flag (e.g., ./download_data.sh -h), it will print out the usage instructions. The usage instructions explain how to use the script and what the different options and arguments mean.
