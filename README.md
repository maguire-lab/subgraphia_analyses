# Repository Describing the SubGraphia Evaluation and Benchmarking
See [SubGraphia](https://github.com/maguire-lab/SubGraphia) for the main repository.

This repository accompanies the paper: Subgraphia: Improving Metagenomic Antimicrobial Resistance Gene Detection and Genomic Context Characterisation. 

The following contains the code used to simulate the data and perform the analyses described in the paper.

## Simulation and Mock Metagenomic Data

- See `datasets/README.md` for descriptions of the datasets used to evaluate SubGraphia.

## Length and correctness - figure 2
- Panel A: genomic content length distribution
    - Summarized metadata is used to account for cases where multiple and/or many contexts are extracted all assigned to the same taxon. It is unclear which is correct, the median is chosen for future analyses. 
- Panel B: correctness of extracted contexts
    - Evaluated using the Zol suite of tools, specifically `fai` to compare annotations of the extracted contexts to the ground truth reference genomes. 
        - See `fai_correctness/fai_synteny_corr.sh`
        - See `fai_correctness/bakta_subgraphia.sh` for the Bakta annotation of the extracted contexts.