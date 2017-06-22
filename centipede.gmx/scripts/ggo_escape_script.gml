if( global.game_mode == 0) {
     if (!instance_exists(cheat_info_obj)) {
         game_end();
     }
}

if (global.game_mode > 0) {
    sound_stop_all();
    global.mushroom_hunter = 0;
    if global.game_mode = 1 then global.game_mode = 0; //Back to Demo Mode
    global.demo = true;
    score = 0;
    global.cheating = false;
    global.game_over = 1; //Game Over has Occurred, this alerts program to draw Game Over text
    alarm[3] = 30*5; //This timer turns off Game Over variable and thus the Game Over text
    global.all_stop = false; //Game is no longer frozen
    centipede_spawn = false; //Centipede are currently not spawning
    alarm[9] = 1; bob = 1;
}
