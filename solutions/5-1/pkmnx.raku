#!/usr/bin/env raku

# reduced from yyz's: https://github.com/yangyanzhan/raku-riddle-contest/blob/main/solutions/5-1/yangyanzhan.raku

my ($n, $k) = (prompt, "RAKU").map(*.ords);
(^$n).map({ (($k[$_ %$k.elems] +$n[$_]) %26 +65).chr }).join.say;
