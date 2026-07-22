#!/bin/bash

# read in list of filenames from ref_assembly_filenames.txt
FILENAMES=$(cat to_annotate.txt)

for F in $FILENAMES

do 
    # get basename of file without extension
    BASENAME=$(basename "$F" .fasta)

    bakta --db /data/raid1_HDD/David/db/bakta_light/db-light/ "$F" --output /data/raid1_HDD/David/graph_searching_sarand/high_complexity_assemblies/high_complexity_annotations/${F%.fasta} --skip-plot

done