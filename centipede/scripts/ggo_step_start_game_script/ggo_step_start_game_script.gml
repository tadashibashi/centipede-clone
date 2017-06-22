/// @description /////PRESS SPACE TO START THE GAME/////////////////////////////

if (keyboard_check_pressed(vk_space)) && (global.demo) {

///SET GAME VARIABLES//////////////////////////////////////////
    //Game Mode
    global.demo = false; //No longer the demo
    global.game_mode = 1; //Game play mode set
    global.players = 1; //One player mode
    global.all_stop = false;  //Will double-check that the game is not left frozen
    
    //Ship variables established in ship
    ship_obj.move_counter = 0;
    ship_obj.move_type = 1;
    
    //Score, Lives, Level
    score = 0; //player 1 score reset
    global.score2 = 0; //player 2 score reset (might add 2 player mode later)
    global.extra_life_counter = 0; //Keeps track of points towards extra lives
    lives = 3; //lives set to 3
    global.level = 1; //Level 1 Set
    even_or_odd_level = 0; //Keeps track of even and odd levels
    level_old = 0; //Detects if level has changed
    
    //Enemies Killed and other Variables
    global.spiders_killed = 0;
    global.geckos_killed = 0;
    global.bugs_killed = 0;
    global.spider_points = 0;
    bug_drop = 0;
    cent_createx = 0;


///////CREATION AND DESTRUCTION////////////////////////////////////
  //DESTROY ALL necessary OBJECTS as described in script
  script_execute(destroy_script);
  //Centipede Creation Variables
  global.centipede_regen = false; //Centipedes do not regenerate
  cent_regen_counter = 0; //Centipede regeneration timer reset
  centipede_spawn = false; //Do not spawn Centipedes yet
  centipede_in = false; //Centipedes do not exist in play area
  alarm[6] = 30; //Centipedes will begin to spawn in 1 second

  //Create the Ship at the middle-bottom of screen
  instance_create(120,240,ship_obj);

  ////////CREATE ALL THE MUSHROOMS//////////////
  //Initiate X and Y Variables to speed up"for" loop
  var drawX;
  var drawY;
  //Somewhere between 40-50 iterations of creation
  for (i = 0; i < ceil(round(random(10)))+40; i += 1) {
     ////sets the X and Y parameters randomly within room
     mush_createx = 8*ceil(round(random(30))); mush_createy = 8*ceil(round(random(28))+1)
     ////checks if there is a collision at the intended creation point, otherwise it will not create
     if !collision_point(mush_createx,mush_createy,mushroom_obj,true,true) {
          instance_create(mush_createx,mush_createy,mushroom_obj);
     }
  }

}
