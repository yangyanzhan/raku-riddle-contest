for dir("solutions") -> $path {
    my $riddle = $path.Str.split("/")[*-1];
    for dir($path.Str) -> $file {
        if $file.ends-with(".raku") {
            my $user = $file.Str.split("/")[*-1].split(".")[0];
            my $command = "raku test.raku --riddle=$riddle --user=$user";
            my $proc = shell($command, :out);
            if $proc.exitcode == 0 {
                say $command, " : correct";
            } else {
                say $command, " : is incorrect";
                die "error";
            }
        }
    }
}
