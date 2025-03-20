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

# Converted alignment files to fasta file
Used https://sequenceconversion.bugaco.com/converter/biology/sequences/clustal_to_fasta.php

This took streptococcussuis-aligned-clustalw.fasta and output aligned_clustalw.fasta
Also took streptococcussuis.aln and output aligned_Tcoffee.fasta

RPhyloSandbox.R infers a parsimony based and distance based tree.

# Ran Maximum Likelihood Tree Softwares

First I ran IQtree on my two alignments

iqtree -s streptococcussuis-aligned-clustalw.fasta

Analysis results written to: 
  IQ-TREE report:                streptococcussuis-aligned-clustalw.fasta.iqtree
  Maximum-likelihood tree:       streptococcussuis-aligned-clustalw.fasta.treefile
  Likelihood distances:          streptococcussuis-aligned-clustalw.fasta.mldist
  Screen log file:               streptococcussuis-aligned-clustalw.fasta.log

iqtree -s aligned_Tcoffee.fasta

Analysis results written to: 
  IQ-TREE report:                aligned_Tcoffee.fasta.iqtree
  Maximum-likelihood tree:       aligned_Tcoffee.fasta.treefile
  Likelihood distances:          aligned_Tcoffee.fasta.mldist
  Screen log file:               aligned_Tcoffee.fasta.log
  
  Then I will run raxML on my alignments with the trees IQ-Tree suggests
  

  
