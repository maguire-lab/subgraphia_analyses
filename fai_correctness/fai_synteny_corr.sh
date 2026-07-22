#!/bin/bash

# Script to run fai, from the zol suite of tools, to calculate synteny correlation between fasta files
# Many other files are produced in this process that needs to be cleaned up

# Inputs: bakta gbff files for both extracted assembly graph neighbourhoods and the ground truth neighbourhood from the genome used to simulate the data
# Outputs: results tsv file including queried path, ground-truch-match, proportion-query-genes-found, and avg-syntenic-correlation

#usage: ./fai_synteny_corr.sh <path_to_path_gbff_directory> <path_to_ground_truth_gbff_directory> <output_file_name>

# Step 1: process all gbffs using the prepTG function - will convert gbffs to gbks that are compatible with fai
# extracted paths, queries in fai, must be processed then extracted, the ground truth neighbourhoods can be left in the prepTG output directory

# if not enough arguments are provided, print usage and exit
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <path_to_path_gbff_directory> <path_to_ground_truth_gbff_directory> <output_file_name>"
    exit 1
fi

# set inputs as variables
path_to_path_gbff_directory=$1
path_to_ground_truth_gbff_directory=$2
output_file_name=$3

# remove prepTG_query_gbk directory if it exists
if [ -d "./prepTG_query_gbk" ]; then
    rm -r ./prepTG_query_gbk
fi

# run prepTG on the path gbff directory
prepTG -i $path_to_path_gbff_directory -o ./prepTG_query_gbk
mkdir -p ./query_gbk
mv ./prepTG_query_gbk/Genomic_Genbanks_Additional/*.gbk.gz ./query_gbk/
gunzip ./query_gbk/*.gbk.gz
# rm -r ./prepTG_query_gbk

# run prepTG on the ground truth gbff directory
prepTG -i $path_to_ground_truth_gbff_directory -o ./prepTG_db

mkdir -p fai_out

# loop through all the gbks in the query directory and run fai on each
for gbk in ./query_gbk/*.gbk; do

    # extract the base name of the gbk file (without path and extension)
    base_name=$(basename "$gbk" .gbk)

    # run fai on the current gbk file
    fai -i "$gbk" -tg ./prepTG_db/ -o ./fai_out/"$base_name"_fai/ -sct 0.1 -c 16 -dm -fp

    # add base_name to the first column of total_gcs.tsv
    # add if statement to check if total_gcs.tsv exists before trying to add base_name to it
    if [ -f ./fai_out/"$base_name"_fai/Spreadsheet_TSVs/total_gcs.tsv ]; then
        awk -v name="$base_name" 'BEGIN{OFS="\t"} {print name, $0}' ./fai_out/"$base_name"_fai/Spreadsheet_TSVs/total_gcs.tsv > ./fai_out/"$base_name"_fai/total_gcs_with_name.tsv
        # remove header from total_gcs_with_name.tsv
        sed -i '1d' ./fai_out/"$base_name"_fai/total_gcs_with_name.tsv
        # keep only columns 1,2,6,7 from total_gcs_with_name.tsv
        cut -f 1,2,6,7 ./fai_out/"$base_name"_fai/total_gcs_with_name.tsv > ./fai_out/"$base_name"_fai/to_concat.tsv
    else
        # if total_gcs.tsv does not exist, no homology detected to any of the references
        echo "total_gcs.tsv not found for $base_name, skipping..."
    fi

done

# concatenate all the total_gcs_with_name.tsv files into one output file
cat ./fai_out/*/to_concat.tsv > "$output_file_name"
header="queried_path\tground_truth_match\tproportion-query-genes-found\tavg-syntenic-correlation"
sed -i "1i $header" "$output_file_name"

# clean up intermediate files
rm -r ./query_gbk
# rm -r ./fai_out
rm -r ./prepTG_db



    