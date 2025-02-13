# Streptococcus Phylogenetic Study
Using Data Referenced In This Paper 
https://www.microbiologyresearch.org/content/journal/ijsem/10.1099/00207713-48-2-581

pulled from genbank by ascession number in table 1

I will be focusing on streptococcus suis which is a respiratory pathogen that can spread from pigs to humans. My samples were mostly collected from diseased pigs, but also some lambs and calves and humans. My data also comes from several countries including Denmark, The Netherlands, The US and Canada.

# No QC Needed Because Already in Fasta format
# Alignment
First ran clustalw
clustalw -align -infile=streptococcussuis.fasta -outfile=streptococcussuis-aligned-clustalw.fasta

Then ran t_coffee with command
t_coffee streptococcussuis.fasta

T_coffee generated the following files:
streptococcussuis.aln
streptococcussuis.dnd
streptococcussuis.html

t_coffee is in a category of alignment methods called global multiple sequence alignment(MSA). It samples pairwise suboptimal alignments to assess the reliability of MSAs. A benefit of this method is that it can be used with the complete alignments of real sequences. Because it relies on statistical measures instead of comparing to expert information, it is hard to assess it's accuracy.
