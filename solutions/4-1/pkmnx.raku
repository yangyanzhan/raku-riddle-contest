#!/usr/bin/env raku

# see: https://en.wikipedia.org/wiki/Caesar_cipher (but -3)

my $a = ['A'..'Z'].rotate(-3);
prompt.ords.map({$a[$_-65]}).join().say
