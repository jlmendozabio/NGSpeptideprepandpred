#!/usr/bin/perl
##Usage perl ./Calphadist.pl pdbname.pdb A 
#where A is is the chain identifier
use Cwd;
#use Bio::Perl;
#use Bio::Seq;
#use Bio::SeqIO;
use File::Basename;
#use Bio::Tools::pSW;
my $dir = getcwd();
my $fin;

@AAchanges;
my @AAoutfile;
@percentidaa;
@dAA;
$myParent;
my @myParents;
$dParent;
$aaMismatch;
@currAAs;
@currLHAAs;
$currprotsize;
$currLHprotsize;
$currsizes=11;
$pidaa;
$pidab;
@LHprot;
@NRprot;
@LHcounts;
@NRGIs;
$LBtabspace;
$NRtabspace;
@testsplittab;
@testplitspace;



&GetLibHits;
&GetNRSequences;
&Alignbyaa;


sub GetLibHits{
open(LIBHITS, $ARGV[0]);
        my @libraryseqs= <LIBHITS>;
        close(LIBHITS);

	$tseq=$libraryseqs[1];
	@testsplittab=split(/\t/,$tseq);
	@testsplitspace=split(/\s+/,$tseq);

	if($testsplittab[1] ne ""){
		$LBtabspace="tab";
#		print "I will use a tab $testsplittab[1]\n";
	}elsif($testsplitspace[1] ne ""){
                $LBtabspace="space";
#		print "I will use a space $testsplitspace[1]\n";
        }elsif($testsplitspace[1] eq "" && $testsplittab[1] eq ""){
#		print "Something is wrong with Library Sequence File Format!\n";
	}
        foreach $sli(@libraryseqs){
                chomp($sli);
		if($LBtabspace eq "space"){
                	@currentsequence=split(/\s+/,$sli);
		}elsif($LBtabspace eq "tab"){
                	@currentsequence=split(/\t/,$sli);
		}
        	$currGI=$currentsequence[0];
		push(@LHcounts, $currentsequence[0]);
		push(@currLHAAs, $currentsequence[1]);
	}
	$totLHAAs=@currLHAAs;
}

sub GetNRSequences{
	open(NRSEQ, $ARGV[1]);
	my @nrsequences= <NRSEQ>;
	close(NRSEQ);

	$tseq=$nrsequences[1];
        @testsplittab=split(/\t/,$tseq);
        @testsplitspace=split(/\s+/,$tseq);

        if($testsplittab[1] ne ""){
                $NRtabspace="tab";
#                print "I will use a tab $testsplittab[1]\n";
        }elsif($testsplitspace[1] ne ""){
                $NRtabspace="space";
#                print "I will use a space $testsplitspace[1]\n";
        }elsif($testsplitspace[1] eq "" && $testsplittab[1] eq ""){
#                print "Something is wrong with NR Sequence File Format!\n";
        }

	foreach $sli(@nrsequences){
		chomp($sli);


		if($NRtabspace eq "space"){
			@currentsequence=split(/\s+/,$sli);
		}elsif($NRtabspace eq "tab"){
			@currentsequence=split(/\t/,$sli);
		}

		push(@NRGIs,$currentsequence[0]);

		push(@currNRAAs, $currentsequence[1]);
	}
	$totNRAAs=@currNRAAs;
}



sub Alignbyaa{
	for($n=0;$n<$totNRAAs;$n++){
		for($p=0;$p<$totLHAAs;$p++){
				@LHprot=split(//,$currLHAAs[$p]);
				@NRprot=split(//,$currNRAAs[$n]);
				$currsizesNR=@NRprot;
				$currsizesLH=@LHprot;

				for($align=0;$align<$currsizes;$align++){
					if($LHprot[$align] ne $NRprot[$align]){
						$aaMismatch++;
					}
				}
				#if($aaMismatch == 0){
				#	$pidaa=100*($currsizes-$aaMismatch)/$currsizes;
                                ##        $pidaab = sprintf("%.1f", $pidaa);
                                #        print $pidaa .",";
                                #        $aaMismatch=0;
				#}


					$pidaa=100*($currsizes-$aaMismatch)/$currsizes;
					#if($pidaa >70){
						$pidab=sprintf("%.1f", $pidaa);
						print $pidab.",";
			
						#print "$LHcounts[$p],$currLHAAs[$p], is ,$pidab, similar to ,$currNRAAs[$n], $NRGIs[$n]\n";
					#}
				#	$pidaab = sprintf("%.1f", $pidaa);
				#	print $pidaa .",";
					$aaMismatch=0;
				#}
		}
	print "\n";
	}
}#End sub Alignmbyaa
