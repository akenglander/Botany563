library(ape)
library(adegenet)
library(phangorn)

# uncomment the alignement you want to run parsimony on
# ClustalW alignment
# dna <- fasta2DNAbin(file="/Users/akenglander/Documents/GitHub/Botany563/aligned_clustalw.fasta")

# Tcoffee alignment
# dna <- fasta2DNAbin(file="/Users/akenglander/Documents/GitHub/Botany563/aligned_Tcoffee.fasta")

dna2 <- as.phyDat(dna)

D = dist.dna(dna,model="TN93")# can use different models
tre.ini <- njs(D)
parsimony(tre.ini, dna2)

tre.pars <- optim.parsimony(tre.ini, dna2)

plot(tre.ini, cex=0.6)

plot(tre.pars, cex=0.6)
