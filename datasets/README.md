# Descriptions of the datasets used to evaluate SubGraphia
- See table 1
| Metagenome          | Origin    | References |  Reads | Accession   |
| ------------------- | --------- | ---------: | -----: | ----------- |
| ZymoBIOMICS         | mock      |         10 |   8.7M | ERR2984773  |
| Gut                 | simulated |         76 |  30.0M | NA          |
| Environmental       | mock      |        227 | 286.8M | ERR5321934  |
| Wastewater complete | simulated |        334 |  26.0M | NA          |
| Wastewater          | simulated |        903 |  26.0M | NA          |
| Soil                | simulated |       6104 |  60.0M | NA          |
| Halifax wastewater  | real      |         NA |  40.3M | ERR14173593 |

## ZymoBIOMICS Microbial Community Standard
- 8 bacteria 2 yeast 
- Metagenome SRA accession: ERR2984773
- Reference accessions: `ZymoBIOMICS_reference_accns.txt`
- Reference reads processed with `fastp` and assembled with `SPAdes` both with default parameters. 

## Simulated Gut
- Based on single cell sequencing of a human gut microbiome indicating taxa and relative abundance of 76 unique isolates. 
    - Zheng, W., Zhao, S., Yin, Y., Zhang, H., Needham, D. M., Evans, E. D., ... & Weitz, D. A. (2022). High-throughput, single-microbe genomics with strain resolution, applied to a human gut microbiome. Science, 376(6597), eabm1483.
- Reference accessions: `gut_reference_accns.txt`

## Environmental mock community
- Mock community of 227 isolates
- Metagenome SRA accession: ERR5321934
- Reference accessions: `environmental_reference_accessions.txt`
- ATB assembly download script: `ATBdwnld_environmental.sh`

## Simulated wastewater
- Simulated wastewater metagenome based a Halifax NS wastewater metagenome: ERR14173593
- Reference genomes and relative abundances identified using nf-core taxprofiler pipeline (v1.2.5) `ww_reference_accessions.txt`

## Complete simulated wastewater
- A subset of the simulated wastewater metagenome above with only complete reference genomes: `complete_ww_reference_accessions.txt`
- Simulation done with an exponential distribution as no abundances available. 

## Soil
- Simulated soil metagenome based on a soil metagenome: SRR5456987
- Same simulation as high complexity simulation in:
    - Mahoney, D. B. J., & Maguire, F. (2025). Best of Both Worlds? Optimising Graph-Based Antimicrobial Resistance Gene Profiling in Long and Short-Read Metagenomes. bioRxiv, 2025-12.

## in-silico seq command gut, wastewater, and soil
``` 
iss generate --draft <path_to_reference_assemblies> --abundance_file <path_to_abundances_file> --model miseq --output miseq_reads --cpus 12 --n_reads <number_of_reads>
```