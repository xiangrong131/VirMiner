#!/usr/bin/perl -w
use strict;
use warnings;
use Getopt::Long;
use Data::Dumper;
use FindBin qw($Bin $Script);
use File::Basename qw(basename dirname);
my $BEGIN_TIME=time();
my $version="1.0.0";
#######################################################################################

# ------------------------------------------------------------------
# GetOptions
# ------------------------------------------------------------------
my ($fIn,$fIn2,$fOut,$PMDepth);
GetOptions(
				"help|?" =>\&USAGE,
				"i:s"=>\$fIn,
				"o:s"=>\$fOut,
				"d:s"=>\$PMDepth,
				) or &USAGE;
&USAGE unless ($fIn and $fOut);
open (IN,$fIn) or die $!;
open OUT,">$fOut" or die $!;
#$/=">";
my %hash1;
my %hash2;
my $query = '';
while (<IN>) {
	chomp;
	my($gene_id,$VPF_id,$evalue)= split /\t/,$_;
		if ($query ne $gene_id) {
			$query = $gene_id;
			print OUT "$gene_id\t$VPF_id\t$evalue\n";
		}
	next;
    }

#    $query .= $_;
#}

close (IN);
close (OUT);

#######################################################################################
print STDOUT "\nDone. Total elapsed time : ",time()-$BEGIN_TIME,"s\n";
#######################################################################################

# ------------------------------------------------------------------
# sub function
# ------------------------------------------------------------------
sub ABSOLUTE_DIR{ #$pavfile=&ABSOLUTE_DIR($pavfile);
	my $cur_dir=`pwd`;chomp($cur_dir);
	my ($in)=@_;
	my $return="";
	if(-f $in){
		my $dir=dirname($in);
		my $file=basename($in);
		chdir $dir;$dir=`pwd`;chomp $dir;
		$return="$dir/$file";
	}elsif(-d $in){
		chdir $in;$return=`pwd`;chomp $return;
	}else{
		warn "Warning just for file and dir\n";
		exit;
	}
	chdir $cur_dir;
	return $return;
}

sub GetTime {
	my ($sec, $min, $hour, $day, $mon, $year, $wday, $yday, $isdst)=localtime(time());
	return sprintf("%4d-%02d-%02d %02d:%02d:%02d", $year+1900, $mon+1, $day, $hour, $min, $sec);
}


sub USAGE {#
	my $usage=<<"USAGE";
Program:
Version: $version
Contact:Tingting Zheng <tingting.zheng\@connect.hku.hk> 
Description:
Usage:
  Options:
  -i <file> the reformated hmmalignment output file
  -o <file> extracted top hits from hmmalignment output file   
  -h         Help

USAGE
	print $usage;
	exit;
}
