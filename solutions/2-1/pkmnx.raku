#!/usr/bin/env raku

#
# see: https://tools.ietf.org/html/rfc2045
#

our @map64 = (['A'..'Z'], ['a'..'z'], [0..9], ['+', '/']).flat;

sub MAIN( $w = slurp.Str.chomp ) {

   cnv64($w).say;

}

sub cnv64($w) {

   my $o = [];
   my @bn = $w.ords.map({ sprintf "%08s", $_.base(2) }).join("").comb();
   while @bn {
      my $f = @bn.splice(0,6).join("");
      $f = sprintf "%-6s", $f;
      $f ~~ s:g/\s/0/;
      $o.push( @map64[ ":2<$f>".Int ] );
   }

   return [ $o.join(""), '=' x (4 - ($o.elems % 4)) ].join("");
}
