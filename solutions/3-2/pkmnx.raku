#!/usr/bin/env raku

#
# see: https://oeis.org/A022916
#

sub MAIN() {
   my $n = prompt;
   $n--;
   my $fn = -> $x { [*] 1 .. $x }
   say $fn($n) / ([*] (^3).map({ $fn(($n + $_)/3) }) )
}
