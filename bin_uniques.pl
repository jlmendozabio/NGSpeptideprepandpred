#!/usr/bin/perl

#bin 1= 2B4
#bin 2=226
#bin 3= 5cc7
#bin 4= 1 +3
#bin 5= 2 + 3
#bin 6= 2 + 1
#bin 7= 1+2+3

$fname= $ARGV[0];
$cutoff= $ARGV[1];



        $fout1="bin_2B4_cuttoff_".$cutoff.".csv";
        $fout2="bin_226_cuttoff_".$cutoff.".csv";
        $fout3="bin_5cc7_cuttoff_".$cutoff.".csv";
        $fout4="bin_2B4_5cc7_cuttoff_".$cutoff.".csv";
        $fout5="bin_226_5cc7_cuttoff_".$cutoff.".csv";
        $fout6="bin_2B4_226_cuttoff_".$cutoff.".csv";
        $fout7="bin_2B4_226_5cc7_cuttoff_".$cutoff.".csv";
        $fout8="bin_under_cuttoff_".$cutoff.".csv";
        open (OUT1, '>',  $fout1);
        open (OUT2, '>', $fout2);
        open (OUT3, '>', $fout3);
        open (OUT4,  '>',$fout4);
        open (OUT5, '>', $fout5);
        open (OUT6,  '>',$fout6);
        open (OUT7,  '>',$fout7);
        open (OUT8,  '>',$fout8);

open my $fh, '<', $fname or die "error opening $fname: $!";

        my @stats= <$fh>;
        foreach $sequence (@stats) {
                                @columns=split(/\,/,$sequence);
                               if(($columns[1] >= $cutoff)&&($columns[2]<$cutoff)&&($columns[3]<$cutoff)){
                                        print OUT1 $sequence;
                                }elsif(($columns[1]<$cutoff)&&($columns[2]>=$cutoff)&&($columns[3]<$cutoff)){
                                        print OUT2 $sequence; 
                                }elsif(($columns[1]<$cutoff)&&($columns[2]<$cutoff)&&($columns[3]>=$cutoff)){
                                        print OUT3 $sequence;
                                }elsif(($columns[1]>=$cutoff)&&($columns[2]<$cutoff)&&($columns[3]>=$cutoff)){
                                        print OUT4 $sequence;
                                }elsif(($columns[1]<$cutoff)&&($columns[2]>=$cutoff)&&($columns[3]>=$cutoff)){
                                        print OUT5 $sequence;
                                }elsif(($columns[1]>=$cutoff)&&($columns[2]>=$cutoff)&&($columns[3]<$cutoff)){
                                        print OUT6 $sequence;
                                }elsif(($columns[1]>=$cutoff)&&($columns[2]>=$cutoff)&&($columns[3]>=$cutoff)){
                                        print OUT7 $sequence;
                                }else{
									print OUT8 $sequence; 
				}
}




