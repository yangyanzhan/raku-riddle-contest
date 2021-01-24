#!/usr/bin/env raku

# see: https://en.wikipedia.org/wiki/ROT13 (but see: ROT47)

prompt.ords.map({(33+(($_+14)%94)).chr}).join().say
