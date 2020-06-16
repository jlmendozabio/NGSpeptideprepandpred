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
my @scoreMatrix;
my @parsedscores;
my $currprotsize;
my @currAAs;
my $currGI;
my $Matrixsize;
my $initialscore;
my $currseqfrag;
my(%scolumn)=('A'=>0,'C'=>1,'D'=>2,'E'=>3,'F'=>4,'G'=>5,'H'=>6,'I'=>7,'K'=>8,'L'=>9,'M'=>10,'N'=>11,'P'=>12,'Q'=>13,'R'=>14,'S'=>15,'T'=>16,'V'=>17,'W'=>18,'Y'=>19);


&GetMatrix;
&GetNRdb;


sub GetMatrix{
open my $sfile, '<', $ARGV[0] or die "error opening $scoresfile: $!";
#open my $sfile, '<', 'ScoreMatrixHighMidHigh.txt' or die "error opening $scoresfile: $!";
my @scoreMatrix= <$sfile>;
$Matrixsize=@scoreMatrix;
$size=@scoreMatrix;

	for($sz=0;$sz<$size;$sz++){
		@scores=split(/,/,$scoreMatrix[$sz]);
		$sizescores=@scores;
		for($szscores=0;$szscores<$sizescores;$szscores++){
			$parsedscores[$sz][$szscores]=$scores[$szscores];
		}
	}
	
}
#End GetMatrix


sub GetNRdb {

open my $nrdbfile, '<', '/home/jlmend/nrdb/nr_split.aa' or die "error openeing $nrdbfile: $!";
#open my $nrdbfile, '<', '/home/jlmend/nrdb/test.nr' or die "error openeing $nrdbfile: $!";
my @nrsequences= <$nrdbfile>;
foreach $sli(@nrsequences){
@currentsequence=split(/\s+/,$sli);
$currGI=$currentsequence[0];
@currAAs=split(//,$currentsequence[1]);
$currprotsize=@currAAs;
&Alignbyaa;
}
}


sub Alignbyaa{
		
	for($step=0;$step<=$currprotsize-$Matrixsize;$step++){
	$currseqfrag="";
	$currscore=1;
		for($framect=0;$framect<$Matrixsize;$framect++){
			#print $currAAs[$framect+$step];
			$currscore=$currscore*$parsedscores[$framect][$scolumn{$currAAs[$framect+$step]}];
			$currseqfrag=$currseqfrag.$currAAs[$framect+$step];
		}
			#print "\n";
		if ($currscore>0){
			print $currGI.",",$currseqfrag."\n";
		}
	}
				
}#End sub Alignmbyaa








