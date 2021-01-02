my $input = slurp.Int;

sub valid(@visited, $j) {
    my $i = @visited.elems + 1;
    for 1..@visited.elems -> $i1 {
        my $j1 = @visited[$i1 - 1];
        if $j == $j1 {
            return False;
        }
        if abs($i - $i1) == abs($j - $j1) {
            return False;
        }
    }
    return True;
}

sub search($n, @visited) {
    if @visited.elems == $n {
        return [@visited, ];
    }
    my @result = [];
    for 1..$n -> $j {
        if valid(@visited, $j) {
            my @sub-result = search($n, flat @visited, [$j]);
            @result.append: @sub-result;
        }
    }
    return @result;
}

my $solutions = search $input, [];
say $solutions.elems;
