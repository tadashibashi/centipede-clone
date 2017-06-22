//@Create necessary healing object to flag ggo to revert it to normal
if (global.game_mode == gameMode.mush) { 
	if (life < 4) || (super_mushroom) {
		instance_create(x,y,need_heal_obj); 
	}
}