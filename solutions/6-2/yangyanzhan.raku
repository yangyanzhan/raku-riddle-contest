my $n = slurp.Int;

my $sum = 0;

for 1..200000 -> $i {
    if $i % 2 == 1 {
        $sum += 1 / (2 * $i - 1);
    } else {
        $sum -= 1 / (2 * $i - 1);
    }
}

say ($sum * 4).round(0.1 ** $n);
