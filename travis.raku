for dir("solutions") -> $path {
    my $riddle = $path.Str.split("/")[*-1];
    for dir($path.Str) -> $file {
        if $file.ends-with(".raku") {
            my $user = $file.Str.split("/")[*-1].split(".")[0];
            my $command = "raku test.raku --riddle=$riddle --user=$user";
            my $start = DateTime.new(now);
            my $proc = shell($command, :out);
            my $end = DateTime.new(now);
            if $proc.exitcode == 0 {
                say $command, " : correct [{$end - $start}s]";
            } else {
                say $command, " : is incorrect";
                die "error";
            }
        }
    }
}
