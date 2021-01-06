#!/usr/bin/env raku

#
# see: https://www.cl.cam.ac.uk/~mr10/ and "Backtracking Algorithms in MCPL using Bit Patterns and Recursion"
#  and more generally, see: https://oeis.org/A000170
#
# and see timings & usage:
#
#   pk@pkx:~/stuff/raku/riddle_contest$ time pkmnx.raku 12
#   14200
#   real    0m0.583s
#   ...
#   pk@pkx:~/stuff/raku/riddle_contest$ time pkmnx.raku 13
#   73712
#   real    0m2.035s
#   ...
#   pk@pkx:~/stuff/raku/riddle_contest$ time pkmnx.raku 14
#   365596
#   real    0m9.867s
#   ...
#   pk@pkx:~/stuff/raku/riddle_contest$ time pkmnx.raku 15
#   2279184
#   real    1m3.110s
#   ...
#   pk@pkx:~/stuff/raku/riddle_contest$ time pkmnx.raku 16
#   14772512
#   real    7m40.561s
#   ...
#

sub MAIN( $tgrs = slurp.Int ) {

   my @no of Int = 0;
   ntgrs( 0, 0, 0, ((1 +< $tgrs)-1), @no);

   @no[0].say;

}

sub ntgrs( int $l, int $cl, int $r, int $al, @no ) {
   $cl == $al && @no[0]++;
   my int $p = +^($l+|$cl+|$r) +& $al;
   while ($p) {
      my int $msk = $p +& -$p;
      $p -= $msk;
      ntgrs( (($l+|$msk) +< 1), ($cl+|$msk), (($r+|$msk)+>1), $al, @no );
   }
}
