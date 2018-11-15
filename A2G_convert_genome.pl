#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);
use File::Basename;
#a2g a2c a2t c2a c2g c2t g2a g2c g2t c2t c2g c2a
my @type = qw(a2g);
my $elem;
my $first;
my $last;
my $up_first;
my $up_last;
foreach $elem (@type) {
$first = substr($elem, 0, 1);
$last = substr($elem, 2, 1);
$up_first = uc $first;
$up_last = uc $last;
my %replacements = ("$up_first" => "$up_last", "$first" => "$last");

  say "Convert $up_first to $up_last in $ARGV[0]";
my $line;
my $file=$ARGV[0];
my ($suffix) = $file =~ /(\.[^.]+)$/;
#say $suffix;
my $filename = basename($file ,$suffix);
#say $filename;
open (R,">$filename.$elem.$suffix");
open my $genome, $file or die "Could not open $file: $!";
	while($line=<$genome>){
	chomp $line;
	if ($line =~ m/^>/){
	print R "$line\n";
	}else{
	$line=~ s/(@{[join "|", keys %replacements]})/$replacements{$1}/g;
	#$line=~ tr/\Q$up_first\E/$up_last/;
	print R "$line\n";}
	}
}
	close(R);