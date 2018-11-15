#!/usr/bin/perl -w

use strict;
use warnings;
use feature qw(say);
my $fastq_file = $ARGV[0];
my @type = qw(a2g);
my $elem;
my $first;
my $last;
my $up_first;
my $up_last;
my $suffix='fq';
foreach $elem (@type) {
$first = substr($elem, 0, 1);
$last = substr($elem, 2, 1);
$up_first = uc $first;
$up_last = uc $last;
my %replacements = ("$up_first" => "$up_last", "$first" => "$last");
 say "Convert $up_first to $up_last in $ARGV[0]";
open (R,">$fastq_file.$elem.$suffix");
open (my $InFile,$fastq_file);

while (<$InFile>)
{
    my $IDLine = $_;
    my $SeqLine = <$InFile>;
    my $BlankLine = <$InFile>;
    my $BQLine = <$InFile>;
	$SeqLine=~ s/(@{[join "|", keys %replacements]})/$replacements{$1}/g;

    print R "$IDLine$SeqLine$BlankLine$BQLine";
}
close R;
}
