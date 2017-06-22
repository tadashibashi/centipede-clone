  //Quit the game if in demo mode
if( global.game_mode == gameMode.demo) {
         game_end();
}

  //Escape will reset the game is in game mode
if (global.game_mode == gameMode.game) {
      //Stop all audio
	gmwPostEvent(global.EV_stopAllSound,sound_controller.id);
	  //Set game mode to demo
	global.game_mode = gameMode.demo;
	  //demo is true
	global.demo = true;
	  //Reset score
    score = 0;
	  //Game Over var triggers drawing "Game Over" text in demo mode
    global.game_over = 1;
	  //This timer turns off Game Over variable and thus the Game Over text
    global_game_obj.alarm[3] = 30*5; 
	  //Ensures game is not frozen for some reason
    global.all_stop = false;
	   //Centipede are currently not spawning
    global_game_obj.alarm[9] = 1; bob = 1;
    global_game_obj.centipede_spawn = false; 
}
