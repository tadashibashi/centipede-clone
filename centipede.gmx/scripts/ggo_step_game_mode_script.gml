//CHECKS GAME MODE and acts accordingly //

/////RESET LEVELS after beating last level///////////////////////////////
if (global.level >= 15) {
   global.level = 1;
}
//Variable check for centipede death
if (global.cent_justdied == 1) {
     die_counter += 1;
     if (die_counter >= 5) {
          die_counter = 0;
          global.cent_justdied = 0;
     }
}

//Power Up Functionality Timer
if (global.power_up_timer > 0) {
    global.power_up_timer -= 1;
}


/////////////////////////////////////////////////////////////////////////////////
/////GLOBAL GAME MODE 0: DEMO MODE///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
if (global.game_mode = gameMode.demo) { //Mode 0 = demo mode
    if (sound_isplaying(background_bloop_snd)) {
        sound_stop(background_bloop_snd); //stop bloop sound
    }
    if (!instance_exists(invis_mushroom_obj))  { //ensure only one-time action
        script_execute(create_invis_mushroom_obj_script); //create all invis mush
    }
}

/////////////////////////////////////////////////////////////////////////////////
/////GLOBAL GAME MODE 1: GAME PLAY MODE//////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
if (global.game_mode == gameMode.game) && (instance_exists(invis_mushroom_obj)) {
      //When the Game Starts, destroy all invisible blocks that back the text
    with (invis_mushroom_obj) instance_destroy();  
}

///////////////////////////////////////////////////////////////////////////////
//////GAME MODE 3: MUSHROOM REPARATIONS////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
if (global.game_mode == gameMode.mush) { //Mode 3
   //Reset Important Game Variables
   centipede_in = false; //Centipede is not on the playing field
   cent_regen_counter = 0; //Centipede Regeneration counter is reset
   cent_spawn_created = 0; //Centipede spawn creation checker reset
   centipede_spawn = 0; //Centipede are currently not being spawned
   global.mushroom_hunter = 0; //Cheat powerup to kill mushrooms in one-shot off
   global.centipede_regen = false; //Centipede are not being regenerated
   if (healing == 0) {healing = 1; alarm[1]=35;} //Start healing in about a second
   if (global.demo == false) {sound_stop(background_bloop_snd);} //If demo stop sound
   global.all_stop = true; //freeze all movement

//A hacky way of Repairing the Mushrooms
//Replace mushroom_healer_shooter with mushroom_indicator_obj to heal given row
    if (instance_exists(mushroom_healer_shooter)) {
        if (shoot_mushrooms == 1) { //one time event trigger variable
            shoot_mushrooms = 0;    //reset event trigger
            instance_create((instance_nearest(x,y,mushroom_healer_shooter)).x,
             (instance_nearest(x,y,mushroom_healer_shooter)).y,mushroom_indicator_obj);
            with (instance_nearest(x,y,mushroom_healer_shooter)) {
                  instance_destroy();
            }
        }
    } else { //once there are no more mushroom_healer_shooter obj then end task
        if (shoot_mushrooms == 1) {
               shoot_mushrooms = 0; //ensure trigger is reset
               alarm[2] = 10; //alarm sets game_mode to 4
        }
    } //End if instance_exists mushroom_healer_shooter else statement
} //End if game_mode == 3


/////////////////////////////////////////////////////////////////////
//////GAME MODE 4: LOSE LIFE, REPLACE SHIP, RESUME PLAY//////////////
/////////////////////////////////////////////////////////////////////

if (global.game_mode = gameMode.dead) { //Mode4

    //////healing variables makes these actions a ONE STEP-ONE TIME EVENT///////////////////
    if (healing == 1) {
        healing = 0 //Keep this script from repeating itself
        script_execute(destroy_enemies_script); //Destroy All Enemies
        alarm[6] = 30 //respawn the centipede in 1 second
        centipede_in = false //centipede is not in the game yet

       if (lives >= 2) && (global.demo = false) {
                 global.all_stop = false; //unfreeze movement
                 if (!instance_exists(ship_obj)) { //Makes sure ship does not exist
                        instance_create(120,240,ship_obj); //to avoid 2 ship_obj"s
                        global.game_mode = 1; 
                        lives -= 1;
                 }
       } else if (lives <= 1) {
                 sound_stop(background_bloop_snd);//stops background blooping sound
                 global.game_mode = gameMode.hiScore; 
                 lives -= 1;
                 cursor_location = 0; //this is the position of cursor when entering high score
                 letter = 0; //This letter is the one that will indicate which letter"you are on"
                 confirmed_letter[0] = " "; //Initializes the letters for
                 confirmed_letter[1] = " "; //entering High Score
                 confirmed_letter [2] = " ";
       }

       //IF IN DEMO MODE (Lives do not matter here)
       if (global.demo) {
             global.all_stop = false; //Unfreeze the Game
             global.game_mode = gameMode.demo; //Keep Game in Demo Mode
             //Double checks ships existence to avoid creating 2 ships
             if (!instance_exists(ship_obj)) {
                   instance_create(120,240,ship_obj); //Create Ship
             }
       }


  }//if (healing = 1) end

}//if (global.game_mode = 4) end


///////////////////////////////////////////////////////////////////////
///////////Go to DRAW EVENT for Highscore MODE ////////////////////////
