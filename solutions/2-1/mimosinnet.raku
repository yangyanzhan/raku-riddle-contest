#!/usr/bin/env raku

# see https://en.wikipedia.org/wiki/Base64
# Heavily based on pkmnx solution. Thanks for all the ideas.

class Base64 {
  has $.string;
  has $.binary;
  has $!ls-bits; # least significant bits 
  has @!map64 = (['A'..'Z'], ['a'..'z'], [0..9], ['+', '/']).flat;

  submethod TWEAK{
    $!ls-bits =  6 - (( $!string.chars * 8 ) % 6);
    $!binary  = $!string.ords.map( { sprintf '%08s', $_.base(2) } ).join ~ '0' x $!ls-bits;
  }
  
  method base64() {
    my $padding = '=' x $!ls-bits/2;
    return $!binary.comb(6).map({ @!map64[sprintf "%02s", ":2<$_>".Int] }).join ~ $padding;
  }

}

sub MAIN( $msg = slurp.Str.chomp ) {
  Base64.new( string => $msg ).base64.say;
}

