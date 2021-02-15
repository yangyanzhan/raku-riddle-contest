#!/usr/bin/env raku


# I think this eqn is easy to understand and converages faster than yyz's leibniz; it calculate's past 100 digits, using primitive ops, in ~1/2 sec on my box.
# 
# see: pk@pkx:~/stuff/raku/riddle_contest/raku-riddle-contest/solutions/6-2$ time echo 104 | pkmnx.raku
# 3.14159265358979323846264338327950288419716939937510582097494459230781640628620899862803482534211706798214
#
# real    0m0.565s ...
#

my $che;
my $fct = -> Int $x { $x == 0 ?? 1 !! ( $che{$x}:exists ?? $che{$x} !! $x * $fct($x -1) ) }

my $pi = 0;

for ( 0 .. 345 ) -> $k {

   my Int $a = 1;
   $a *= 2 for (^$k -1);

   my Int $b = $fct($k) * $fct($k);

   my $c = $fct(2*$k +1);

   $pi += FatRat.new($a * $b, $c);

}

my $n = slurp.Int + 1;
my $vl = $pi * 2;
$vl.comb()[0 .. $n].join("").say;

