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
my $goodfile=$dataf[0]."-QAd.pfam";
my $BadEndfile=$dataf[0]."-BE.pfam";
my $Stpfile=$dataf[0]."-Stp.pfam";
#my $outdir = $datadir . $datafileprefix;
#mkdir($outdir,0755);
#my $filename= $datadir.$datafile;
my $goodorbad;
my $peplength;
my $ctStp;
my $ctBE;
my $ctGood;
my $total;
@columns;
@currMSAseq;
&ReadMSAfile;
print "You have $ctBE bad ends, $ctStp with Stops, and $ctGood good sequences out of a total of $total\n";






#Subroutines

sub ReadMSAfile{
	open (GoodOUT, ">$goodfile");
	open (StpOUT, ">$Stpfile");
	open (BEOUT, ">$BadEndfile");

	open $tf, '<', $datafile or die "error opening $templatesfile: $!";
	my @filedata= <$tf>;
        foreach $line (@filedata) {
		$total++;
                my (@columns) = split(/\s+/, $line);
       		@currMSAseq=split(//, $columns[1]);
		$peplength=@currMSAseq;

		for ($ct=0;$ct<$peplength-1;$ct++){
			if(($currMSAseq[$ct] eq "*")||($currMSAseq[$ct] eq "?")){
				print StpOUT $line;
				$ctStp++;
				$goodorbad="bad";
				last;
			}
		}
		
		if($goodorbad ne "bad"){
			if(($currMSAseq[$ARGV[2]-1] eq uc($ARGV[1]))&&($currMSAseq[$ARGV[4]-1] eq uc($ARGV[3]))){
		                print GoodOUT $line;
				$ctGood++;
        		}else{
                                print BEOUT $line;
				$ctBE++;
			}

		}
			$goodorbad="";

		}

}    #end ReadMSAfile


