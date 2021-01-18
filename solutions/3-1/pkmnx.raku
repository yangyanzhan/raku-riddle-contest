#!/usr/bin/env raku

#
# see: https://oeis.org/A001405 
#

sub MAIN() {
   my int $n = prompt;
   $n--;
   say combinations( $n, ($n/2).floor ).elems
}
