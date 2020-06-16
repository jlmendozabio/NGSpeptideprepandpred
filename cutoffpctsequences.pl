#!/programs/x86_64-linux/perl/5.10.1/bin/perl
#
use Cwd;
use File::Path;
use File::Copy;


$pct=$ARGV[1];
$round=1+$ARGV[0];
$real=$round-1;
$outname = "uniques_round".$real."Pct".$pct.".fasta";
open (OUT, ">> $outname"); 
@sorted;
@data;
@fields;
$it;
$maxcount;
$Ufile='uniques_stats.csv';
@currArray;
$count=0;
$topcount;
&ReadMSAfile;
print "Your fasta file is $outname\n"; 

#Subroutines

sub ReadMSAfile{


	open my $fh, '<', $Ufile or die "error opening $fname: $!";
		while (my $line = <$fh>){
		chomp $line;
		my @fields=split (/,/, $line);
		push @data, \@fields;
		$count += $fields[$round];
#		print "$fields[$round]\n";
	}
	close($fh);	
my @sorted = sort {$b->[$round] <=> $a->[$round] } @data;
$maxcount=$pct*$count/100;
print "Round $real has $count total reads so will cuttoff when the total of reads for the unique sequences >= $maxcount\n";
$it=0;


while ($currcount < $maxcount){
	print OUT ">$sorted[$it][0]\n";
	print OUT $sorted[$it][0]."\n";
	$currcount = $currcount+ $sorted[$it][$round];
	$it++;
	}
$tseq=$it+1;
print "Total number of sequences is $tseq\n";

}


