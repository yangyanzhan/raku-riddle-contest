sub MAIN(Str :$riddle, Str :$user) {
    say "riddle description:";
    say "===========================";
    shell "cat ./riddles/$riddle/desc.txt";
    say "===========================";
    my $wrong-count = 0;
    for dir("./riddles/$riddle/case").sort({$^a.Str.split("/")[*-1].Int cmp $^b.Str.split("/")[*-1].Int}) -> $case-path {
        my $answer = "$case-path/output.txt".IO.slurp.trim;
        my $proc = shell "cat $case-path/input.txt | raku solutions/$riddle/$user.raku", :out;
        my $output = $proc.out.get.trim;
        if $answer ~~ $output {
            say "Test Case: $case-path ✅";
        } else {
            $wrong-count++;
            say "Test Case: $case-path ❌ - Your output is $output";
        }
    }
    if $wrong-count == 0 {
        say "All Correct 🎉🎉🎉";
    } else {
        say "$wrong-count Test Cases are incorrect 😞😞😞";
        die "oops";
    }
}
