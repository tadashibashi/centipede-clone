global.level = 1; //keeps track of the level to change sprite colors
script_execute(level_text_color_script); //sets the font and font color

sound_stop_all(); //Stop All Audio When the Game Starts

bob = 1; 

enum gameMode {
    demo = 0,
    game = 1,
    mush = 3,
    dead = 4,
    hiScore = 5
}

alarm[9] = 30;
alarm[6] = 30;

//Variables for Cheating Functionality
cheat = 0;
global.cheating = 0;
//Game Mode Variables
   global.ghgame = 0; //(May or may not add grasshopper game)
   global.all_stop = false; //Game is not frozen
   global.game_over = 0; //This is not a Game Over
   global.game_mode = 0; //Game Mode starts in Demo Mode
   global.demo = true;  //Demo Mode is currently happening
   global.players = 2; //player two mode may or may not be added
   global.player_current = 0; //no players currently playing at the moment
   pause = false;

//Enemies Killed and other Variables
   global.bugs_killed = 0;
   global.spiders_killed = 0;
   global.spiders_killed2 = 0;
   global.geckos_killed = 0;
   die_counter = 0;
   global.cent_justdied = 0;
   spider_chance = 0; //If = 1 a spider will appear
   bug_drop = 0; //The higher the counter, the higher the chance a flea will spawn
   centipede_spawn = false; //Centipede are currently not spawning
   cent_regen_counter = 0; //Centipede Regeneration counter is reset
   global.centipede_regen = false; //Centipede Regeneration is not happening
   centipede_in = false; //Centipede is currently not in the game play area
   gap = 0; //This is a step counter that measures how far apart to spawn individual
           //centipede to link them together into a chain
   gap_cap = 2; //Gap Counter Maximum for spawning centipedes
   bug_chance = 0;//variable giving the bug a chance to fall
   cent_createx = 0;
//powerups
   global.mushroom_hunter = 0;
   global.power_up_timer = 0;
//Score, Lives, Levels
   score = 0; //Score is reset
   score_last = 0; //Detects if there is a change in the score
   global.score2 = 0; //(may or may not add 2player mode)
   global.spider_points = 0; //Points that are gained after you kill a spider
   points_trigger = 0; //Show points mode on (when you kill a spider)
   points_show = 0; //Show points after you kill a spider
   points_x = 0; //X location of where the points should be drawn
   points_y = 0; //Y location of where the points should be drawn
   lives = 0; //Lives are 0 in demo mode
   global.level = 1; //Level starts as 1
   global.extra_life_counter = 0; //Every 12000 points, get extra life, then reset counter
   even_or_odd_level = 0; //Variable for detecting if the level number is even or odd
   level_old = 0; //Variable for detecting if there is a change in level

   //sound
   vol = 1;
//Mushrooms Variables////////////////////////////////
   //Healing Mode
   shoot_mushrooms = 0; //counter for executing healing mushroom
   next_zone = 0; //a counter for mushroom healing after player dies
   p = 0; //counter for frequency mushroom healers fall after player dies
   healing = 0; //state where 0 = not healing mushrooms, 1 = healing mushrooms
   //Mushroom creation variables at game start
   m = 0;
   mush_createx = 0; //mushroom create coordinate x
   mush_createy = 0; //mushroom create coordinate y

//High Score Input Variables; when global.game_mode == 5//////////////////////////////////////////////////////
  letter = 0; //the variable that describes your name numerically; gets translated into input_letter variable
  input_letter = 0; //this is the letter string that will input your name on high score
  cursor_location = 0; //place holder for high score input, it tells which letter you are on.
  a = 0; //timer for high score input. Changes the potential letters as you increase or decrease
  name = 0; //highscore input name
  pause = 0; //0:play, 1:pause. pause game variable
  input_mode = 1;  //1:mouse, 2:keyboard. This is to control the high score input
  b = 0; //timer for detecting if the mouse has been active or not
  oldx = mouse_x; //this helps tell if the mouse has been active
  oldy = mouse_y; //the oldx and y variables will be compared to current x and y values.


//Create Grid Array for Collision Detection for Mushrooms
for (var i = 0; i <= room_width div 8 + 4; i += 1)  {
    for (var j = 0; j <= room_height div 8 + 4; j += 1) {
          cells[i,j] = 0;
        }
    }
