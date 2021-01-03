my $tigers = slurp.Int;

#| Tiger extinction
class Extinction {
  has $.tigers;
  has $.tigers_previous_encounter;
  has $.tigers_this_encounter;
  has $.tigers_next_encounter;

  method extinction {
    return 
      self.tigers == self.tigers_previous_encounter || 
      abs(self.tigers_next_encounter - self.tigers_this_encounter) == abs(self.tigers - self.tigers_previous_encounter);
  }
}

#| Tiger survival
class Survival {
  has @.encounters;
  has $.tigers;

  method survival {
    for 1..self.encounters.elems -> $encounter {
      return False if Extinction.new(
          tigers                    => $.tigers,
          tigers_previous_encounter => @.encounters[$encounter - 1],
          tigers_this_encounter     => $encounter,
          tigers_next_encounter     => @.encounters.elems + 1
        ).extinction;
    }
    return True;
  }
}

#| Tiger encounters
sub encounters($tigers, @encounters) {
  if @encounters.elems eq $tigers {
    return [@encounters, ];  
  }                          
  my @total_encounters = []  ;
  for 1..$tigers -> $tiger   {
    if Survival.new( encounters => @encounters, tigers => $tiger).survival {
      my $new_encounter := (@encounters, [$tiger]).flat;
      my @encounter_events = encounters( $tigers, $new_encounter );
      @total_encounters.append: @encounter_events;
    }
  }
  return @total_encounters;
}

sub riddle( $tigers ) {
  return (encounters $tigers, []).elems;
}

riddle( $tigers ).say;


