sub path-to-n1-n2($path) {
    my $n1 = 0;
    my $n2 = 0;
    my $item = $path.Str.split("/")[*-1];
    if $item.contains("-") {
        $n1 = $item.split("-")[0].Int;
        $n2 = $item.split("-")[1].Int;
    } else {
        $n1 = $item.Int;
    }
    return ($n1, $n2);
}
for dir("solutions").sort({ path-to-n1-n2($^a) cmp path-to-n1-n2($^b) }) -> $path {
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
