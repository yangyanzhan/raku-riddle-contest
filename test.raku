sub MAIN(Str :$riddle, Str :$user) {
    my $wrong-count = 0;
    for "./riddles/$riddle.txt".IO.lines -> $line {
        my @parts = split(" ", $line);
        my $input = @parts[0];
        my $answer = @parts[1];
        my $proc = shell "echo $input | raku solutions/$riddle/$user.raku", :out;
        my $output = $proc.out.get;
        if $answer == $output {
            say "Test Case: $line ✅";
        } else {
            $wrong-count++;
            say "Test Case: $line ❌";
        }
    }
    if $wrong-count == 0 {
        say "All Correct 🎉🎉🎉";
    } else {
        say "$wrong-count Test Cases are incorrect 😞😞😞";
    }
}
