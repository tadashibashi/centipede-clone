  //Sprite is not transparent
draw_set_alpha(1);
  //Draw laser on the Ship if Ship exists, and if there are no lasers present
if (instance_exists(ship_obj)) && (instance_number(laser_obj) == 0) {
	draw_sprite(laser_wait_spr,global.level - 1,ship_obj.x,ship_obj.y - 2);
}

/////////////////////////////////////////////////
//II. Draw Score and High Score (All Times)/////
////////////////////////////////////////////////

   //a. Draw Score and High Score
      //1. 1 Player Mode Score Display Settings (shows at all times anyway)

      level_text_color_script();
	    //Aligned text on right side.
      draw_set_halign(fa_right); 
		//Add extra zero in 10"s place
      if (score < 10) {
        draw_text(40,.5,string_hash_to_newline(0));
      } 
		//If player 1 has hi-score, then get value from player 1 score
      if (score >= highscore_value(1)) { 
           highest_score = score;
      } else {
		     //else, get value from hi-score board
           highest_score = highscore_value(1); 
      }
		//Draw player 1 score in upper-left
      draw_text(48,.5,string_hash_to_newline(score)); 
	     //Draw highest score in center-top
      draw_text(18*8,.5,string_hash_to_newline(highest_score));

      //2. 2 Player Mode Score Display Settings/////////// NOT IMPLEMENTED
      if (global.players == 2) {  //Only draw during player 2 mode.
            if (global.score2 >= highscore_value(1)) { //If player 2 has hi score
                 highest_score = global.score2;//then draw  p2  ashighest_score
            }
            draw_text(240,.5,string_hash_to_newline(global.score2)); //Draw player 2 score in top right.
            if (global.score2 < 10) {
                draw_text(232,.5,string_hash_to_newline(0)); //Draws "0"'
            } 
      }

   //b. Draw Lives
   lives_draw = lives - 1;
   lives_draw1 = lives - 1;
   lives_draw2 = lives - 1;
   //Limit Each lives_draw variable according to limit
   if (lives_draw >= 5) then {lives_draw = 5};
   if (lives_draw1 >= 10) then {lives_draw1 = 10};
   if (lives_draw2 >= 15) then {lives_draw2 = 15};

     //Initiate Variables for the "for" loops
   var drawX, var drawY, var drawX1, var drawY1, var drawX2, var drawY2;
   drawX = 48; drawY = 0; drawX1 = 48; drawY1 = 0; drawX2 = 48; drawY2 = 0;
     //Draw sprites as many lives you have minus 1, because your ship counts as 1.
     //If you have more than 5 lives, it will begin to change color, +1 level
   for (var i = 0; i < lives_draw; i += 1) {
    draw_sprite(ship_spr,global.level-1,drawX,drawY); drawX += 9;
   }
   for (var i = 0; i < lives_draw1-5; i += 1) {
    draw_sprite(ship_spr,global.level,drawX1,drawY1); drawX1 += 9;
   }
    for (var i = 0; i < lives_draw2-10; i += 1) {
    draw_sprite(ship_spr,global.level+1,drawX2,drawY2); drawX2 += 9;
   }

   //c. Draw Mouse Sprite
   //Draw Mouse sprite if Ship exists and is not on mouse coordinates
  if (!global.demo) && (instance_exists(ship_obj)) && (ship_obj.mouse_dist > 4) {
		draw_sprite_ext(mouse_spr,0,mouse_x,mouse_y,1,1,0,c_blue,.6);
  }
  if (global.game_mode == 5) && (score > highscore_value(8)) {
  draw_sprite_ext(mouse_spr,0,mouse_x,mouse_y,1,1,0,c_blue,.6);
  }
//if the ship does not exists, the mouse is drawn anyway

//DRAW SPIDER SCORE//
 if (points_trigger) {  //when a spider dies, the points are triggered to be displayed
    points_trigger = false; //turn off the points trigger for this one-time event
    points_show = true; //variable activating showing the points
    alarm[0] = 60; //set 2-second alarm to turn off the display
 }
 if (points_show) { //showing of points activated
    draw_sprite(points_spr,points_amount +//this equation sets the sprite index
    (global.level-1)*3,points_x,points_y);//correctly and draws the points
 }
