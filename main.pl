#! /usr/local/env perl
use strict;
use warnings;
use utf8;

use Try::Tiny;

my $test = "test";
try {
  print "$test\n";
} catch {
  warn "error $_";
};
