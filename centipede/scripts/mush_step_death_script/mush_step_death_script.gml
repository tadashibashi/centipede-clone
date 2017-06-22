//@MUSHROOM DEATH///////////////////////////////////////////////////////
  //mushroom health is depleted
if (life < 1) {
	  //Increase the chance for a flea to fall
	if (!instance_exists(bug_obj)) {
		global_game_obj.bug_drop += 1; //variable increases chances the higher it is
		global_game_obj.bug_chance = true; //gives the global_game_obj a chance to create flea
	}
	  //Increase the score by 1 during gameplay only (not the demo)
	if (!global.demo) {
		score ++;
	}
	  //Destroy self
	instance_destroy();
}
