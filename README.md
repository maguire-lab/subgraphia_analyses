# Repository Describing the SubGraphia Evaluation and Benchmarking
[![DOI](https://img.shields.io/badge/DOI-PUTDOIHERE-blue)]()

See [SubGraphia](https://github.com/maguire-lab/SubGraphia) for the main repository.

This repository accompanies the paper: Subgraphia: Improving Metagenomic Antimicrobial Resistance Gene Detection and Genomic Context Characterisation. 

The following contains the code used to simulate the data and perform the analyses described in the paper.

## Simulation and Mock Metagenomic Data

- See `datasets/README.md` for descriptions of the datasets used to evaluate SubGraphia.

## Length and correctness - figure 2
- See `length_correctness_fig2/`
- Panel A: genomic content length distribution
    - Summarized metadata is used to account for cases where multiple and/or many contexts are extracted all assigned to the same taxon. It is unclear which is correct, the median is chosen for future analyses. 
- Panel B: correctness of extracted contexts
    - Evaluated using the Zol suite of tools, specifically `fai` to compare annotations of the extracted contexts to the ground truth reference genomes. 
        - See `fai_correctness/fai_synteny_corr.sh`
        - See `fai_correctness/bakta_subgraphia.sh` for the Bakta annotation of the extracted contexts.

## Filtration evaluation - figure 3
- See `filtration_eval_fig3/`
- Aim to investigate if the filtration steps are working as intended and if error is biased towards certain AMR genes of MGEs
- Done using the complete wastewater dataset to avoid ambiguity caused by fragmented assemblies. 
- MGEs identified using Mob recon v3.1.9, sequences extracted using samtools v1.2.0, alignments with minimap2 v2.28

## Clinker visualizations - figure 4
- Select genomic contexts visualized via clinker v0.0.31 and bandage v0.8.1

## Real world wastewater dataset - figure S5
- See `real_metagenome_figS5`
- An example of how SubGraphia can be used in conjunction with other AMR profiling tools to analyse real world data and identify genomic contexts of AMR genes otherwise missed by other tools.

## Benchmarking - figure 5
- Benchmarking SubGraphia against ARGcontextprofiler and Sarand
- Datasets: ZymoBIOMICs mock community, and simulated wastewater metagenome