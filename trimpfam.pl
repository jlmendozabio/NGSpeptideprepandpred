#!/usr/bin/perl
#This counts the number of amino acids at specific positions
#
use Cwd;
use File::Path;
use File::Copy;

my $datadir = getcwd . "/";
my $datafile= $ARGV[0];
my @dataf=split(/.pfam/, $datafile);
my $datafileprefix= $dataf[0];
my $fastafile=$dataf[0]."-cAt_".$ARGV[1]."_". $ARGV[2]."_.pfam";

my $goodorbad;
@columns;
@currMSAseq;
&ReadMSAfile;


#Subroutines

sub ReadMSAfile{
	open (FASTAOUT, ">$fastafile");

	open $tf, '<', $datafile or die "error opening $templatesfile: $!";
	my @filedata= <$tf>;
        foreach $line (@filedata) {
	                my (@columns) = split(/\s+/, $line);
			print FASTAOUT $columns[0]."\t";
			@aln=split(//,$columns[1]);
			for ($a=$ARGV[1]-1;$a<$ARGV[2];$a++){
				print FASTAOUT $aln[$a];
			}				
			print FASTAOUT "\n";


		}

}    #end ReadMSAfile


