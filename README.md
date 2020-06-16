# NGSpeptideprepandpred
scripts for processing NGC data for TCR recognition of peptide sequences and prediction
  List of Programs for Deep sequencing
 fasta2pfam.pl <input.fasta> <output.pfam>
 This program quickly and easily converts a fasta sequence file
 to pfam format.
 pfam2fasta.pl <input.pfam>
This program will convert a pfam sequence file to fasta format. trimpfam.pl <input.pfam> startpos endpos
countUniques-generic.pl <input.pfam>
alignmentFrequencies.pl <input.pfam>
sortALLMSA.pl <input.pfam>
   This script will trim the sequences in your pfam sequence file
 i.e. sequences that are length of 100 and you want only
 positions 10 to 20, running this script will do this for you.
  This script will generate an output of unique sequences along
 with a statistics file.
  This script will give you positional frequencies for an
 alignment. Output is a csv file.
  This script provides library frequency statistics on a
 positional basis and important for co-variation analysis. This
 scripts generates a subdirectory of the sequence file and the
 Matlab scripts need to access this directory for visualization
 and analysis. Matlab script must be edited for each sequence
 file.
 UniquesPfamtoIndividualPfam.pl <input.pfam>

  bin_uniques.pl <input_1.pfam> ... <input_N.pfam>
 This script generates a csv file listing data of unique
 sequences in all the inputted sequence files for generating a
 Vinn diagram type analysis.
 AlignNRtoLib_tophits.pl <input_Library_sequences.pfam>
 <input_NR_hits.pfam> X
 This script align Library sequences to NR hits and outputs the
 hits NR hits that have a sequence in your library with a greater
 than X sequence identity.
 AlignNRtoLib_Matrix.pl <input_Library_sequences.pfam>
 <input_NR_hits.pfam>
 This script align Library sequences to NR hits and outputs a
 matrix of sequence identities. This can get very large dependent
 on number of sequences in each input file.
 perl /usr/local/bin/deepsequence/AlignHitstoOneSequence.pl
 GAGseq.txt NRhits_17_7.txt > percentIDtoGAT.txt
 This will read out of percent identity of the NRhits list to
 your single sequence.
 cutoffpctsequences.pl Round# Pct#
 You must run this from where your uniques_stats.csv file is
 located. This will output the sequences required to reach Pct#
 of reads. 

 List of Programs for Deep sequencing
 fasta2pfam.pl <input.fasta> <output.pfam>
 This program quickly and easily converts a fasta sequence file
 to pfam format.
 pfam2fasta.pl <input.pfam>
This program will convert a pfam sequence file to fasta format. trimpfam.pl <input.pfam> startpos endpos
countUniques-generic.pl <input.pfam>
alignmentFrequencies.pl <input.pfam>
sortALLMSA.pl <input.pfam>
   This script will trim the sequences in your pfam sequence file
 i.e. sequences that are length of 100 and you want only
 positions 10 to 20, running this script will do this for you.
  This script will generate an output of unique sequences along
 with a statistics file.
  This script will give you positional frequencies for an
 alignment. Output is a csv file.
  This script provides library frequency statistics on a
 positional basis and important for co-variation analysis. This
 scripts generates a subdirectory of the sequence file and the
 Matlab scripts need to access this directory for visualization
 and analysis. Matlab script must be edited for each sequence
 file.
 UniquesPfamtoIndividualPfam.pl <input.pfam>

  bin_uniques.pl <input_1.pfam> ... <input_N.pfam>
 This script generates a csv file listing data of unique
 sequences in all the inputted sequence files for generating a
 Vinn diagram type analysis.
 AlignNRtoLib.pl <input_Library_sequences.pfam>
 <input_NR_hits.pfam> X
 This script align Library sequences to NR hits and outputs the
 hits NR hits that have a sequence in your library with a greater
 than X sequence identity.
 AlignNRtoLib_Matrix.pl <input_Library_sequences.pfam>
 <input_NR_hits.pfam>
 This script align Library sequences to NR hits and outputs a
 matrix of sequence identities. This can get very large dependent
 on number of sequences in each input file.
 cutoffpctsequences.pl Round# Pct#
 You must run this from where your uniques_stats.csv file is
 located. This will output the sequences required to reach Pct#
 of reads. 
