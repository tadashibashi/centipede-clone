//@ SUPER MUSHROOM SCRIPT//////////////////////////////////////
  //Collision with Gecko, super_mushroom set to true during gameplay (not mushroom recovery mode)
if (collision_rectangle(x+2,y+2,x+6,y+6,gecko_obj,true,false)) {
	if (!super_mushroom) && (global.game_mode != gameMode.mush) {  //prevents infinite points bug during mushroom regeneration
		super_mushroom = true;
	}
}
  //Create one super_mushroom_obj invisible collider
if (super_mushroom) && (super_mushroom_create == 0) {
     super_mushroom_create = 1; //Ensures only one created
     instance_create(x,y,super_mushroom_obj); //Creation
}
  //if for some reason NO super_mushroom_obj created, reset creation var
if (super_mushroom_create == 1) && (!collision_point(x,y,super_mushroom_obj,true,false)) {
   super_mushroom_create = 0;
}