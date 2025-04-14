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
  
Note IQ-tree is really nice because it does not require a tree as an input. It also uses stochastic hill climbing methods to try to escape local optima. It allows for reversible and nonreversible models and has a built in algorithm to account for missing data. However for optimal results it assumes the user will run it multiple times to get best results with the stochastic element. It uses a lot of RAM, although it tries to make up for that with it's memory saving mode and because of the stochastic element it can have poor reproducibility.

  Then I will run raxML on my alignments with the trees IQ-Tree suggests
  
# Bayesian Inference

I downloaded Mr Bayes. Then I converted my clustal file to nexus file which were named:
"streptococcussuis-aligned-clustalw.fasta" and "streptococcussclustal.nexus"

I used the converter at https://sequenceconversion.bugaco.com/converter/biology/sequences/index.html
I used input "clustal" output "nexus"

I created Mr Bayes command file MrB1.txt

Then I concatenated it to the nexus file with this command
cat streptococcussclustal.nexus MrB1.txt > streptococcussclustal_mb1.nexus
I changed the outgroup in the Mr Bayes commands at the end of the nexus file

Then I used this command to run it
mb streptococcussclustal_mb1.nexus

The output files were named streptococcussclustal_mb1.nexus.**



