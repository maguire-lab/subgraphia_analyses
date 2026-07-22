#!/bin/bash

# Script to download ATB assemblies using a list of biosample accessions

# load accessions from file
ACCESSIONS=$(cat accessions_in.txt)

# loop through each accession and download the corresponding assembly
for ACCESSION in $ACCESSIONS; do
    echo "Downloading assembly for biosample accession: $ACCESSION"
    # remove carrage return
    CLEAN_ACCN=$(echo "$ACCESSION" | tr -d '[:cntrl:]')
    # Using wget to download the assembly
    wget https://allthebacteria-assemblies.s3.eu-west-2.amazonaws.com/${CLEAN_ACCN}.fa.gz
done

