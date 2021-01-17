#!/usr/bin/env raku

## see https://en.wikipedia.org/wiki/Ascii85 & https://metacpan.org/pod/Convert::Ascii85

sub MAIN( $w = slurp.Str.chomp ) {
   ascii85($w).say
}

sub ascii85($w) {

   my $pdn = ($w.chars % 4) > 0 ?? 4 - ($w.chars % 4) !! 0;
   my $pd = "\0" x $pdn;

   my $outp;
   my $i = 0;
   while ( $i < $w.chars ) {

      my $v = $w.substr($i,4);
      if $v.chars < 4 {
         $v ~= $pd;
      }

      my $bs = $v.ords.map( *.fmt('%08b') ).join("");
      my $bi = ":2<$bs>".Int;

      my $st;
      for (^5) -> $i {
         my $md = $bi % 85;
         $bi = ($bi / 85).Int;
         $st.prepend(( $md + 33 ).chr);
      }
      $outp.push( $st.join("") );
      $i += 4;
   }

   my $op = $outp.join("");
   $op ~~ s/z$/!!!!!/;

   return $op.substr( 0, $op.chars - $pdn );

}
