  //Position script - snap to grid, destroy if out of bounds, delete duplicates
mush_step_position_script();
  //Collision with gecko = super_mushroom status
mush_step_supermush_script();
  //Mushroom death script - increase points, increase bug drop chance, destroy self
mush_step_death_script();
  //Create necessary healing object to flag ggo to revert it to normal
mush_step_healing_script();