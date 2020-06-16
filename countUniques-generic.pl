#!/programs/x86_64-linux/perl/5.10.1/bin/perl
#
use Cwd;
use File::Path;
use File::Copy;
use List::MoreUtils 'uniq';
use List::MoreUtils 'true';
open (OUT, '> uniques_stats.csv'); 
@currArray;
@AoA;
@Allseqs;
@uniqueSeqs;
@revuniqueSeqs;
$numrounds=@ARGV;
$i=0;
$j;
$count;
$ict;
@delelements;
@revdelelements;
@prefix;
 print "localtime: ". localtime() ."\n";
&ReadMSAfile;
&countUniques;
 print "localtime: ". localtime() ."\n";
close (OUT);
#Subroutines

sub ReadMSAfile{

	foreach $fname (@ARGV) {

		open my $fh, '<', $fname or die "error opening $fname: $!";
		$fout="uniqueseq-".$fname;
		@prefix=split(/.pfam/,$fname);	
		open my $Uout, '>', $fout or die "error opening $fout: $!";
		my @seqs= <$fh>;
			foreach $sequence (@seqs) {
				chomp($sequence);
				@columns=split(/\s+/,$sequence);
				push(@currArray,$columns[1]);
			#	push(@Allseqs, $columns[1]);
			}
	close($fh);	
	@currUniqs=uniq(@currArray);	
	unshift(@Allseqs,@currUniqs);
	$uct=1;
	foreach (@currUniqs){
		print $Uout "$prefix[0]-$uct     $_\n";
		$uct++;
	}
	close($Uout);
	push @AoA, [@currArray];
	@currArray=();
	$i++;
	close($fout);
	}

	@uniqueSeqs = uniq(@Allseqs);
        $totalUniques=@uniqueSeqs;

	open my $Allout, '>', "Uniques_All.pfam" or die "error opening $fout: $!";
	$uct=1;
	foreach (@uniqueSeqs){
                print $Allout "uniques_All-$uct     $_\n";
                $uct++;
        }
}    #end ReadMSAfile

sub countUniques{
	foreach $uniq(@uniqueSeqs){
#		if ($uniq eq "AAAQVAFLKAATKAGGGS"){
	#		print "HEEEEEEEEEEEELLLLLLLLLLPPPPPPPPP\n";
	#	}
		print OUT $uniq;
		for($j=0;$j<$numrounds;$j++){
			@delelements=();
			$currsZ=@{$AoA[$j]};
			# #print "Rnd $j is $currsZ\n";
			$ict=0;
			$count=0;
			foreach $dup (@{$AoA[$j]}){
				if ($uniq eq $dup){
					unshift(@delelements,$ict);
				}
				$ict++;
			}
					
			$count=@delelements;
#			my $count = true { /$uniq/ } @{$AoA[$j]}; 		
			print OUT ",". $count;
			
			foreach $elnum (@delelements) {
#				#print "$elnum\n";
#				#print "$AoA[$j][$elnum]\n";
				splice(@{$AoA[$j]}, $elnum, 1);
			}

			
		}
		
		print OUT "\n"; 
	}
}


