  //@COLLISION WITH mushroom_repair_obj = MUSHROOM REPARATIONS
if (life < 4) || (super_mushroom) {
	if (global.game_mode == gameMode.mush) {
		  //life is restored to max
		life = 4; 
	      //Score+5 when in game mode (not demo mode)
		if (!global.demo) {
			score += 5;
		}
		  //take away super mushroom status
		super_mushroom = false; 
	      //change the sprite back to regular mushroom (not super)
		sprite_index = mushroom_spr; 
	      //s triggers the mushroom_healer_obj, ensures only one triggered iteration
		s = 0; 
  }
}