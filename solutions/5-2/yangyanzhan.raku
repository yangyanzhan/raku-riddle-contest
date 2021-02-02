# credit: https://github.com/LaurentRosenfeld/Perl-6-Miscellaneous/blob/master/Challenges-in-Perl6/Vigenere-cypher.md

my $uppercase-string = slurp.trim;
my $decrypt = False;
my $key = "RAKU" ~ $uppercase-string;
my $base = "A".ord;
my $key-length = $key.chars;

my @string = $uppercase-string.comb.map({ $_.ord - $base });
my @key    = $key.comb.map({ $_.ord - $base });

for ^@string.elems -> $p
{
  $decrypt
    ?? print ($base + (@string[$p] - @key[$p] + 26) mod 26).chr
    !! print ($base + (@string[$p] + @key[$p]) mod 26).chr;
}

say "";
