# Process to generate clinker figures

## Gene identification
- Complete wastewater SubGraphia summaries, RGI on contig results, and the RGI outputs on the ground truth reference genomes were used to identify the genes of interest for clinker visualizations.

## Annotation
- Sequences were annotated using `../fai_correctness/bakta_subgraphia.sh`

## Clinker
- Clinker visualizations in html format generated using:
```
clinker files/*.gbk -p plot.html
```
- visualizations were then exported to svg format using the clinker html interface.

## Bandage:
- Bandage visualizations generated using the extracted subgraph surrounding the gene of interest using the GUI. Exported to svg format. 
- final svg files were then edited in Inkscape to add labels and adjust the layout for publication.