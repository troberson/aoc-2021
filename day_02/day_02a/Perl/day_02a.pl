#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

my $test_solution = 150;
my $fname_test    = 'input_test';
my $fname_final   = 'input';

my $test_result = process_file($fname_test);
my $test_ok     = ( $test_result == $test_solution );
my $test_msg    = $test_ok ? 'SUCCESS!' : 'FAIL';
say "Test result: $test_result ($test_msg)\n";
if ( !$test_ok ) {
    say "Test failed.";
    exit(1);
}

say "AoC Result: " . process_file($fname_final);

sub process_file {
    my ($fname) = @_;

    open my $fh, '<', $fname or die "Cannot open $fname: $!";
    my @lines = <$fh>;
    close $fh;

    process_data(@lines);
}

sub process_data {
    my (@input) = @_;

    my $horiz = 0;
    my $depth = 0;
    foreach my $line (@input) {
        process_line( $line, \$horiz, \$depth );
    }

    say "Horizontal: $horiz, Depth: $depth";
    return $horiz * $depth;
}

sub process_line {
    my ( $line, $horiz, $depth ) = @_;

    my ( $cmd, $dist ) = split /\s+/, $line;
    if    ( $cmd eq 'forward' ) { $$horiz += $dist; }
    elsif ( $cmd eq 'down' )    { $$depth += $dist; }
    elsif ( $cmd eq 'up' )      { $$depth -= $dist; }
    else                        { die "Unknown command: $cmd"; }
}
