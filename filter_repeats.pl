#!/usr/bin/perl -w
use strict;

my $sim_rep_file = $ARGV[0];
my $sam_file = $ARGV[1];
open (my $f, $sim_rep_file);
my $repeats_str = '';
my $repeat_len = 10;
while (<$f>)
{
    my $rep_line = uc $_;
    chomp $rep_line;
    if (length($rep_line) > 1)
    {
	$repeats_str .= "($rep_line)\{$repeat_len,\}|";
    }
    if (length($rep_line) == 1)
    {
	$repeats_str .= "($rep_line)\{$repeat_len,\}\\w?($rep_line)\{$repeat_len,\}|";
    }

}
chop $repeats_str;

close($f);
open (my $InSamFile,$sam_file);
while (<$InSamFile>)
{
    chomp;
    
    my $line = $_;
   
    #my @Fields = split ("\t",$line);
    
    my @Fields = split;
    
    
    if (!@Fields)
    {
	next;
    }
    
# Remove reads with repeats
    if ($Fields[9] =~ /$repeats_str/o)	
    {
       ##print "$SeqLine is repeat $&\n";
       print "$line\n";
    }
	}