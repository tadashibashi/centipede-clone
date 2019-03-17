//Preliminary If Statements///////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

//Keep the Centipede within room boundaries
var _max_x = room_width - 4;
var _max_y = 240 
x = clamp(x, 0, _max_x);

if (y > 240) then {y = 240};

//Keep the Centipede aligned on Grid
if (move_mode == 1) {
      if  x/8 != round(x/8) {
            move_snap(2,1);
      }
}

//If Super Mushroom Is True then check below if this obj is the head
if (super_mushroom) {
     if (!collision_rectangle(x-4,y+4,x+4,y+9,centipede_obj,true,true)) {
          head = true;
     } else {
          head = false;
     }
}

//Cut Off This Event if global.all_stop is true
if (global.all_stop) or (global.game_mode == 3) {
   speed = 0; 
   cent_anim = 0; 
   cent_anim2 = 0;
   exit;
   
} else {

    //If Centipede reaches the bottom of the screen, remove super mushroom status
    if (y >= 240) {
        super_mushroom = false;
    }
    
    //If Centipede is the only one left after emerging onto playing field
    //Increase its speed to 4
    if (instance_number(centipede_obj) == 1) && (y > 16){
        spd = 4;
    }
    
    
     ///////////////////////////////////////////////////////////////////////////////
    //////////MOVE MODE LEGEND//////////////////////////////////////////////////////
    //move_mode: 1 horizontal motion                                              //
    //           2 arced motion going downward                                    //
    //           3 arced motion going upward                                      //
    ////////////////////////////////////////////////////////////////////////////////
     ///////////////////////////////////////////////////////////////////////////////
    
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
    ////////////////////////////////////////////////////////////////////////////////
    ////////MOVE MODE = 1: Horizontal Motion////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<//
    
    if (move_mode == 1) {
    
      ////////Preliminary If Statements///////////////
      //Do not check what part of the body it is (head or body) if about to collide
      //into the objects: side_wall_obj, mushroom_obj, and invis_mushroom_obj.
      if (collision_rectangle(x,y+4,x-9,y+4,side_wall_obj,true,true))
       or (collision_rectangle(x,y+4,x-9,y+4,mushroom_obj,true,true))
       or (collision_rectangle(x,y+4,x+9,y+4,side_wall_obj,true,true))
       or (collision_rectangle(x,y+4,x+9,y+4,mushroom_obj,true,true))
       or (collision_rectangle(x,y+4,x-9,y+4,invis_mushroom_obj,true,true))
       or (collision_rectangle(x,y+4,x+9,y+4,invis_mushroom_obj,true,true)) {
           dont_check_head = true;
      } else {
           dont_check_head = false;
      }//end Do Not Check Body
    
      //If the Centipede is the head, change the sprite index to the head sprite
      //if not, change it to the body sprite.
      if (head) {
          sprite_index = cent_forward_spr;
      } else {
          sprite_index = body_forward_spr;
      }
    
      //Snap the centipede to the grid of its speed
      move_snap(spd,8);
      //Speed is determined by spd
      speed = spd;
    
      //This sets the switch_step to the appropriate starting points
      //before even getting to move_mode 2 or 3. switch_step is the point/step
      //the centipede is at on the curved path when it hits a mushroom or wall
      if (vdir == 1) then switch_step = 0;
      if (vdir == 2) then switch_step = 14;
    
      //Changing Vertical Orientation
      if (y >= 240) then {vdir = 2; global.centipede_regen = true};
      if (vdir == 2) && (y <= 200) then {vdir = 1};
    
    
    
    //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<//
    //IF facing LEFT<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    //move_mode = 1<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<//
    
      if (hdir == 1) {
    
        //Direction is Left <
        direction = 180;
    
        //Check if Head or Body
        if (dont_check_head = false) {
           if collision_point(x-9,y+4,centipede_obj,true,true) {
                head = false;
           } else {
                head = true;
           }
        }//end Check if Head or Body
    
        //Change Movement Mode when centipede hits a mushroom or sidewall
        if x/8 = round(x/8) { //only activate when grid snapped
            if (global_game_obj.cells[abs(x div 8 - 2), y div 8] == 1)
            or (collision_point(x-9,y+4,side_wall_obj,true,true))
            or (go_down) {
                 go_down = false;
                 move_snap(8,8); //snap to grid
                 switch_type = 1; //Heading Left
                 speed = 0; //set speed to 0
                 path_set = 1; //set new path
                 if (vdir == 1) then {move_mode = 2}; //if heading downwards
                 if (vdir == 2) then {move_mode = 3}; //if heading upwards
           } else {
                 switch_type = 0; //otherwise reset switch_type
           }
        }//end Change Movement
    
      }//end IF Facing Left
    
    
    
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
    //IF facing RIGHT>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    //move_mode = 1>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
    
     if (hdir = 2) {
    
      //Direction is Right >
      direction = 0;
    
      //Check if Head or Body Part
      if (dont_check_head = false) {
           if collision_point(x+8,y+4,centipede_obj,true,true) {
                  head = false
           } else {
                  head = true
           }
      }//end Check if Head or Body
    
      //Change Movement when Centipede hits mushroom or side wall
      if (x/8 = round(x/8)) { //this grid snap ensures a consistent movement
            if (global_game_obj.cells[x div 8 + 1, y div 8] = 1)
            or (collision_point(x+9,y+4,side_wall_obj,true,true))
            or (go_down = true) {
                go_down = false;
                move_snap(8,8); //snap to grid
                switch_type = 2; //heading right, curving down left
                speed = 0; //set speed to 0
                path_set = 1 //set new path
                if (vdir = 1) then {move_mode = 2}; //if going down
                if (vdir = 2) then {move_mode = 3}; //if going up
           } else {
                switch_type = 0; //reset switch_type otherwise
        }
      }//end Change Movement
    
     }//end IF Facing RIGHT
    
    
    }//end MOVE MODE 1
    
    
    
    
    
    //((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((//
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV//
    ////////MOVE MODE = 2: Downward Arc Motion//////////////////////////////////////
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV//
    //))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))//
    
    
    if (move_mode = 2) {
    
         dont_check_head = true //do not check if head or body during this time
    
    
    
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV//
    //////SWITCH_TYPE 1 Starting going LEFT<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    //move_mode = 2 VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV//
    
         if switch_type = 1 {
    
             //Set the Curved Downward Path that Centipede will take
             if path_set = 1 {
                  image_xscale = 1 //Facing Left Sprite
                  path_set = 0; //Turn off Trigger
                  step_x[0] = x; step_x[1] = x-1; step_x[2] = x-2; step_x[3] = x-3;
                  step_x[4] = x-4; step_x[5] = x-5; step_x[6] = x-6;
                  step_x[7] = x-7; step_x[8] = x-8; step_x[9] = x-8;
                  step_x[10] = x-8; step_x[11] = x-7; step_x[12] = x-6;
                  step_x[13] = x-5; step_x[14] = x-4; step_x[15] = x-4;
                  step_x[16] = x-4; step_x[17] = x-4; step_x[18] = x-4;
                  step_y[0] = y; step_y[1] = y; step_y[2] = y; step_y[3] = y;
                  step_y[4] = y; step_y[5] = y; step_y[6] = y+1; step_y[7] = y+2;
                  step_y[8] = y+3; step_y[9] = y+4; step_y[10] = y+5;
                  step_y[11] = y+6; step_y[12] = y+7; step_y[13] = y+8;
                  step_y[14] = y+8; step_y[15] = y+8; step_y[16] = y+8;
                  step_y[17] = y+8; step_y[18] = y+8;
                  switch_step = 0;
             }//end Set the Curved Downward Path
    
             //When Path is Completed
             if (switch_step >= 13) {
                  //If step overshoots step 13, set switch_step to 13
                  switch_step = 13
    
                  //If there is another obstacle in next row
                  if (global_game_obj.cells[x div 8 + 1, y div 8] = 1)
                  or (collision_rectangle(x+7,y+2,x+4,y+6,side_wall_obj,true,true))
                  or (super_mushroom = true) {
                        switch_type = 4 //Continue curving downward going right
                        path_set = 1 //Set new path
                  } else { //If there is not another obstacle in next row
                        hdir = 2 //going right
                        image_xscale = -1 //image facing right
                        move_mode = 1 //movement back to horizontal mode
                        switch_step = 14 //finish path
                        switch_type = 0 //reset switch_type
                  }
              }//end When path is Completed
    
             if (switch_step + spd < 13) then {switch_step += spd}; //increase step
             if (switch_step + spd >= 13) then {switch_step = 13}; //cap max 13
             round(switch_step); //Round the number of the Step for to plug in array
             x = step_x[switch_step];//centipede x coordinate on path
             y = step_y[switch_step];//centipede y coordinate on path
    
             //Set Sprite Image Correctly//
    
             //Path Steps 0-4
             if (switch_step >= 0) && (switch_step <= 4) {
                 image_xscale = 1; //Facing Left
                 //Set Sprite to Head if Head and Body if Body
                 if (head = true) {
                     sprite_index = cent_forward_spr
                 } else {
                     sprite_index = body_forward_spr;
                 }
             }
             //Steps 5-7
             if (switch_step >= 5) && (switch_step <= 7) {
                 image_xscale = 1; //Facing Left
                 //Set Sprite to Head if Head and Body if Body
                 if (head = true) {
                      sprite_index = cent_angle_spr
                 } else {
                      sprite_index = body_angle_spr;
                 }
             }
             //Steps 8-10
             if (switch_step >= 8) && (switch_step <= 10) {
                  image_xscale = 1; //Facing Left
                  //Set Sprite to Head if Head and Body if Body
                  if (head = true) {
                      sprite_index = cent_down_spr
                  } else {
                      sprite_index = body_down_spr;
                  }
             }
             //Steps 11-13
             if (switch_step >= 11) && (switch_step <= 13) {
                  image_xscale = -1 //Facing Right
                  if (head = true) {
                       sprite_index = cent_angle_spr
                  } else {
                       sprite_index = body_angle_spr;
                  }
             }
             //Snap to Grid at the start and end of path
             if (switch_step = 0) then {move_snap(8,8)};
             if (switch_step = 14) then {move_snap(8,8)};
    
       }//end switch_type = 1
    
    
    
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV//
    //////SWITCH_TYPE 2 Starting going RIGHT>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    //move_mode = 2 VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV//
    
       if (switch_type = 2) {
            //Sets the curved Path that Centipede will take
            if (path_set = 1) {
                 image_xscale = -1
                 path_set = 0;
                 step_x[0] = x; step_x[1] = x+1; step_x[2] = x+2; step_x[3] = x+3;
                 step_x[4] = x+4; step_x[5] = x+5; step_x[6] = x+6; step_x[7] = x+7;
                 step_x[8] = x+8; step_x[9] = x+8; step_x[10] = x+8;
                 step_x[11] = x+7; step_x[12] = x+6; step_x[13] = x+5;
                 step_x[14] = x+4; step_x[15] = x+4; step_x[16] = x+4;
                 step_x[17] = x+4; step_x[18] = x+4; step_y[0] = y; step_y[1] = y;
                 step_y[2] = y; step_y[3] = y; step_y[4] = y; step_y[5] = y;
                 step_y[6] = y+1; step_y[7] = y+2; step_y[8] = y+3; step_y[9] = y+4;
                 step_y[10] = y+5; step_y[11] = y+6; step_y[12] = y+7;
                 step_y[13] = y+8; step_y[14] = y+8; step_y[15] = y+8;
                 step_y[16] = y+8; step_y[17] = y+8; step_y[18] = y+8;
                 switch_step = 0;
            }
       //Change Movement when Centipede reaches end of Path
       if (switch_step >= 13) {
            switch_step = 13
            if (global_game_obj.cells[abs(x div 8 - 1), y div 8] = 1)
            or (collision_point(x-7,y+4,side_wall_obj,true,true))
            or (super_mushroom = true) {
                 switch_type = 3
                 path_set = 1
            } else {
                 hdir = 1
                 image_xscale = 1
                 move_mode = 1
                 switch_step = 14
                 switch_type = 0
            }
       }//end Change Movement
    
       //Increase switch_step if under 13
       //otherwise set switch_step to 13
       if (switch_step + spd < 13) {
            switch_step += spd;
       } else {
            if (switch_step + spd >= 13) {
                 switch_step = 13;
            }
       }
       //Round switch_step in order to plug it into an array
       round(switch_step);
    
       x = step_x[switch_step]; //x and y values on path
       y = step_y[switch_step];
    
       //Set Sprite Image Correctly//
       //Steps 0-4
       if (switch_step >= 0) && (switch_step <= 4) {
            image_xscale = -1
            if (head = true) {
                 sprite_index = cent_forward_spr;
            } else {
                 sprite_index = body_forward_spr;
            }
       }
       //Steps 5-7
       if (switch_step >= 5) && (switch_step <= 7) {
            image_xscale = -1
            if (head = true) {
                 sprite_index = cent_angle_spr;
            } else {
                 sprite_index = body_angle_spr;
            }
       }
       //Steps 8-10
       if (switch_step >= 8) && (switch_step <= 10) {
            image_xscale = 1
            if (head = true) {
                 sprite_index = cent_down_spr;
            } else {
                 sprite_index = body_down_spr;
            }
       }
       //Steps 11-13
       if (switch_step >= 11) && (switch_step <= 13) {
            image_xscale = 1
            if (head = true) {
                 sprite_index = cent_angle_spr;
            } else {
                 sprite_index = body_angle_spr;
            }
       }
       //Move Snap at the beginning and end of path
       if (switch_step = 0) then {move_snap(4,8)};
       if (switch_step = 14) then {move_snap(4,8)};
    
      }//end switch_type = 2
    
    
    
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV//
    ////SWITCH TYPE 3: Going LEFT CYCLE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    //move_mode = 2VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV//
    
       if (switch_type = 3) {
            if (path_set = 1) {
                 image_xscale = 1
                 move_snap(4,8)
                 path_set = 0;
                 step_x[0] = x; step_x[1] = x-1; step_x[2] = x-2; step_x[3] = x-3;
                 step_x[4] = x-4; step_x[5] = x-4; step_x[6] = x-4; step_x[7] = x-3;
                 step_x[8] = x-2; step_x[9] = x-1; step_x[10] = x; step_x[11] = x;
                 step_x[12] = x; step_x[13] = x; step_x[14] = x;
                 step_y[0] = y; step_y[1] = y; step_y[2] = y+1; step_y[3] = y+2;
                 step_y[4] = y+3; step_y[5] = y+4; step_y[6] = y+5; step_y[7] = y+6;
                 step_y[8] = y+7; step_y[9] = y+8; step_y[10] = y+8;
                 step_y[11] = y+8; step_y[12] = y+8; step_y[13] = y+8;
                 step_y[14] = y+8
                 switch_step = 0
        }
    
       //Path End, Change Movement
       if (switch_step >= 9) {
         switch_step = 9
         if (y >= 239) && (global_game_obj.cells[x div 8 + 1, y div 8] = 1)
          or (y >= 239) && (collision_point(x+7,y+4,side_wall_obj,true,true)) {
              move_mode = 3; vdir = 2; switch_type = 3; path_set = 1;
         } else {
              if (global_game_obj.cells[x div 8 + 1, y div 8] = 1)
               or (collision_point(x+7,y+4,side_wall_obj,true,true))
               or (super_mushroom = true) {
                   switch_type = 4
                   path_set = 1
              } else {
                   hdir = 2
                   image_xscale = -1
                   move_mode = 1
                   switch_step = 10
                   switch_type = 0
              }
         }
       }//end path end
    
       //Maximum Step 9, if greater set it to 9; increase step
       if (switch_step + spd < 9) {
            switch_step += spd
       } else {
            if (switch_step + spd >= 9) {
                 switch_step = 9
            }
       }
    
       //Set X and Y to Path, round the step to plug into array
       round(switch_step);
       x = step_x[switch_step];
       y = step_y[switch_step];
    
       //Set Sprite Images Correctly//
       //Steps 1-4
       if (switch_step >= 1) && (switch_step <= 4) {
            image_xscale = 1
            if (head = true) {
                 sprite_index = cent_angle_spr;
            } else {
                 sprite_index = body_angle_spr;
            }
       }
       //Step 5
       if (switch_step = 5) {
            image_xscale = 1;
            if (head = true) {
                 sprite_index = cent_down_spr;
            } else {
                 sprite_index = body_down_spr;
            }
       }
       //Steps 6-9
       if (switch_step >= 6) && (switch_step <= 9) {
            image_xscale = -1
            if (head = true) {
                 sprite_index = cent_angle_spr;
            } else {
                 sprite_index = body_angle_spr;
            }
       }
        //At beginning and end of path, move snap
        if (switch_step = 0) then {move_snap(4,8)};
        if (switch_step = 10) then {move_snap(4,8)};
    
      }//end switch_type = 3
    
    
    
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV//
    ////SWITCH TYPE 4: Going RIGHT CYCLE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    //move_mode = 2VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV//
    
       if (switch_type = 4) {
            //sets the curved path that centipede will take
            if (path_set = 1) {
                 image_xscale = 1;
                 move_snap(4,8);
                 path_set = 0;
                 step_x[0] = x; step_x[1] = x+1; step_x[2] = x+2; step_x[3] = x+3;
                 step_x[4] = x+4; step_x[5] = x+4; step_x[6] = x+4; step_x[7] = x+3;
                 step_x[8] = x+2; step_x[9] = x+1; step_x[10] = x; step_x[11] = x;
                 step_x[12] = x; step_x[13] = x; step_x[14] = x
                 step_y[0] = y; step_y[1] = y; step_y[2] = y+1; step_y[3] = y+2;
                 step_y[4] = y+3; step_y[5] = y+4; step_y[6] = y+5; step_y[7] = y+6;
                 step_y[8] = y+7; step_y[9] = y+8; step_y[10] = y+8;
                 step_y[11] = y+8; step_y[12] = y+8; step_y[13] = y+8;
                 step_y[14] = y+8
                 switch_step = 0;
            }
    
       //End of Path, Change Movement
       if (switch_step >= 9) {
    
            switch_step = 9
    
            //If Stuck in a Corner, Reverse Direction
            if (y >= 239) && (global_game_obj.cells[abs(x div 8 - 1), y div 8] = 1)
             or (y >= 239) && (collision_point(x-7,y+4,side_wall_obj,true,true)) {
                 move_mode = 3; vdir = 2; switch_type = 4; path_set = 1;
            } else {
                 if (global_game_obj.cells[abs(x div 8 - 1), y div 8] = 1)
                  or (collision_point(x-7,y+4,side_wall_obj,true,true))
                  or (super_mushroom = true) {
                      switch_type = 3
                      path_set = 1
                 } else {
                      hdir = 1
                      image_xscale = 1
                      move_mode = 1
                      switch_step = 10
                      switch_type = 0
                 }
            }
       }//end Change Movement
    
       //Increase Switch_Step if under 9, if over cap it to 9
       if (switch_step + spd < 9) {
            switch_step += spd
       } else {
            if (switch_step + spd >= 9) {
                 switch_step = 9
            }
       }
    
       //Round Switch_Step to plug into array,
       //Set X and Y Values to Path
       round(switch_step);
       x = step_x[switch_step];
       y = step_y[switch_step];
    
       //Set Sprite Image Correctly
       //Steps 1-3
       if (switch_step >= 1) && (switch_step <= 3) {
            image_xscale = -1;
            if (head = true) {
                 sprite_index = cent_angle_spr;
            } else {
                 sprite_index = body_angle_spr;
            }
       }
       //Steps 4-6
       if (switch_step >= 4) && (switch_step <= 6) {
            image_xscale = 1;
            if (head = true) {
                 sprite_index = cent_down_spr;
            } else {
                 sprite_index = body_down_spr;
            }
       }
       //Steps 7-9
       if (switch_step >= 7) && (switch_step <= 9) {
            image_xscale = 1;
            if (head = true) {
                 sprite_index = cent_angle_spr;
            } else {
                 sprite_index = body_angle_spr;
            }
       }
       //Move Snap at beginning and end of path
       if (switch_step = 0) then {move_snap(4,8)};
       if (switch_step = 10) then {move_snap(4,8)};
       }
      }
    
    
    
    
    
     //((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((//
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    ////////MOVE MODE = 3: UPWARD Arc Motion////////////////////////////////////////
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    //))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))//
    
    
    if (move_mode = 3) {
    
         dont_check_head = true //do not check if head or body during this time
    
    
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    ///////SWITCH_TYPE 1 Starting going LEFT<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    //move_mode = 3 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
      if (switch_type = 1) {
           //sets the curved path that centipede will take
           if (path_set = 1) {
    
                image_xscale = 1
                path_set = 0;
                step_x[0] = x-4; step_x[1] = x-5; step_x[2] = x-6; step_x[3] = x-7;
                step_x[4] = x-8; step_x[5] = x-8; step_x[6] = x-8; step_x[7] = x-7;
                step_x[8] = x-6; step_x[9] = x-5; step_x[10] = x-4;
                step_x[11] = x-3; step_x[12] = x-2; step_x[13] = x-1; step_x[14] = x
                step_y[0] = y-8; step_y[1] = y-8; step_y[2] = y-7; step_y[3] = y-6;
                step_y[4] = -5; step_y[5] = y-4; step_y[6] = y-3; step_y[7] = y-2;
                step_y[8] = y-1; step_y[9] = y; step_y[10] = y; step_y[11] = y;
                step_y[12] = y; step_y[13] = y; step_y[14] = y
                switch_step = 14;
           }
           //End Path, Change Motion
           if (switch_step <= 1) {
                switch_step = 1
                     if collision_line(x+9,y+4,x+8,y+4,mushroom_obj,true,true)
                      or collision_line(x+9,y+4,x+8,y+4,side_wall_obj,true,true) {
                          move_snap(8,8); switch_type = 4; path_set = 1
                     } else {
                          move_snap(8,8); hdir = 2; image_xscale = -1; move_mode = 1
                          switch_step = 0; switch_type = 0
                    }
           }//end End Path, Change Motion
    
        //decrease switch_step if greater than 1, else set it to 1
        if (switch_step - spd > 1) then {switch_step -= spd};
        if (switch_step - spd <= 1) then {switch_step = 1};
    
        //round switch_step to plug it into array
        round(switch_step);
        //X and Y Values are set according to path
        x = step_x[switch_step]; y = step_y[switch_step];
    
        //Set the Sprite Image Correctly
        //Steps 0-4
        if (switch_step >= 0) && (switch_step <= 4) {
             image_xscale = -1
             if (head = true) {
                  sprite_index = cent_forward_spr;
             } else {
                  sprite_index = body_forward_spr;
             }
        }
        //Steps 5-7
        if (switch_step >= 5) && (switch_step <= 7) {
             image_xscale = -1
             if (head = true) {
                  sprite_index = cent_angle_up_spr;
             } else {
                  sprite_index = body_angle_up_spr;
             }
        }
        //Steps 8-10
        if (switch_step >= 8) && (switch_step <= 10) {
             image_xscale = 1;
             if (head = true) {
                  sprite_index = cent_up_spr;
             } else {
                  sprite_index = body_up_spr;
             }
        }
        //Steps 11-13
        if (switch_step >= 11) && (switch_step <= 13) {
             image_xscale = 1;
             if (head = true) {
                  sprite_index = cent_angle_up_spr;
             } else {
                  sprite_index = body_angle_up_spr;
             }
        }
        //Move Snap at the beginning and end of the path
        if (switch_step = 0) then {move_snap(8,8)};
        if (switch_step = 14) then {move_snap(8,8)};
       }
    
    
    
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    ///////SWITCH_TYPE 2 Starting going RIGHT>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    //move_mode = 3 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    
       if (switch_type = 2) {
            //sets the curved path that centipede will take
            if (path_set = 1) {
                 image_xscale = 1;
                 path_set = 0;
                 step_x[0] = x+4; step_x[1] = x+5; step_x[2] = x+6; step_x[3] = x+7;
                 step_x[4] = x+8; step_x[5] = x+8; step_x[6] = x+8; step_x[7] = x+7;
                 step_x[8] = x+6; step_x[9] = x+5; step_x[10] = x+4;
                 step_x[11] = x+3; step_x[12] = x+2; step_x[13] = x+1;
                 step_x[14] = x; step_y[0] = y-8; step_y[1] = y-8; step_y[2] = y-7;
                 step_y[3] = y-6; step_y[4] = -5; step_y[5] = y-4; step_y[6] = y-3;
                 step_y[7] = y-2; step_y[8] = y-1; step_y[9] = y; step_y[10] = y;
                 step_y[11] = y; step_y[12] = y; step_y[13] = y; step_y[14] = y;
                 switch_step = 14;
            }
    
       //End Path, Change Motion
       if (switch_step <= 1) {
            switch_step = 1;
            if (collision_point(x-9,y-4,mushroom_obj,true,true))
             or (collision_point(x-9,y-4,side_wall_obj,true,true)) {
                 move_snap(8,8); switch_type = 3; path_set = 1;
            } else {
                 move_snap(8,8); hdir = 1; image_xscale = 1; move_mode = 1;
                 switch_step = 0; switch_type = 0;
            }
        }
    
       if (switch_step - spd > 1) {
            switch_step -= spd;
       } else {
            if (switch_step - spd <= 1) {
                 switch_step = 1;
            }
       }
       //Round switch_step to plug it into the array
       round(switch_step);
       //set the X and Y Values according to the path
       x = step_x[switch_step]; y = step_y[switch_step];
    
       //Set the Sprite Image Correctly
       //Steps 0-4
       if (switch_step >= 0) && (switch_step <= 4) {
            image_xscale = 1;
            if (head = true) {
                 sprite_index = cent_forward_spr;
            } else {
                 sprite_index = body_forward_spr;
            }
       }
       //Steps 5-7
       if (switch_step >= 5) && (switch_step <= 7) {
            image_xscale = 1;
            if (head = true) {
                 sprite_index = cent_angle_up_spr;
            } else {
                 sprite_index = body_angle_up_spr;
            }
       }
       //Steps 8-10
       if (switch_step >= 8) && (switch_step <= 10) {
            image_xscale = 1;
            if (head = true) {
                 sprite_index = cent_up_spr;
            } else {
                 sprite_index = body_up_spr;}
       }
       //Steps 11-13
       if (switch_step >= 11) && (switch_step <= 13) {
            image_xscale = -1;
            if (head = true) {
                 sprite_index = cent_angle_up_spr;
            } else {
                 sprite_index = body_angle_up_spr;
            }
       }
    
       if (switch_step = 0) then {move_snap(8,8)};
       if (switch_step = 14) then {move_snap(8,8)};
    
    }//end switch_type = 2
    
    
    
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    ///////SWITCH_TYPE 3  Going LEFT Cycle<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    //move_mode = 3 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    
       if (switch_type = 3) {
            //sets the curved path that centipede will take
            if (path_set = 1) {
                 image_xscale = 1; move_snap(1,8); path_set = 0;
                 step_x[0] = x; step_x[1] = x-1; step_x[2] = x-2; step_x[3] = x-3;
                 step_x[4] = x-4; step_x[5] = x-4; step_x[6] = x-4; step_x[7] = x-3;
                 step_x[8] = x-2; step_x[9] = x-1; step_x[10] = x;
                 step_y[0] = y-8; step_y[1] = y-8; step_y[2] = y-7; step_y[3] = y-6;
                 step_y[4] = y-5; step_y[5] = y-4; step_y[6] = y-3; step_y[7] = y-2;
                 step_y[8] = y-1; step_y[9] = y; step_y[10] = y;
                 switch_step = 10;
            }
    
            //Path End, Change Motion
            if switch_step <= 1 {
                 switch_step = 1
                 if (y <= 201) && (collision_point(x+9,y-4,mushroom_obj,true,true))
                  or (y <= 201)
                  && (collision_point(x+9,y-4,side_wall_obj,true,true)) {
                       move_snap(8,8); move_mode = 2; vdir = 1;
                       switch_type = 3; path_set = 1;
                 } else {
                       if (collision_point(x+9,y-4,mushroom_obj,true,true))
                        or (collision_point(x+9,y-4,side_wall_obj,true,true)) {
                            move_snap(8,8); switch_type = 4; path_set = 1;
                       } else {
                            move_snap(8,8); hdir = 2; image_xscale = -1;
                            move_mode = 1; switch_step = 0; switch_type = 0;
                       }
                 }
            }//end Path End, Change Motion
       //Reduce switch_step unless under 1, set it to 1
       if (switch_step - spd > 1) {
            switch_step -= spd;
       } else {
            if (switch_step - spd <= 1) {
                 switch_step = 1;
            }
       }
    
       //Round switch_step to apply it to the array
       round(switch_step);
       //Set X and Y Values according to the path
        x = step_x[switch_step]; y = step_y[switch_step];
    
        //Set the Sprite Image Correctly
        //Steps 1-4
        if (switch_step >= 1) && (switch_step <= 4) {
             image_xscale = -1;
             if (head = true) {
                  sprite_index = cent_angle_up_spr;
             } else {
                  sprite_index = body_angle_up_spr;
             }
        }
        //Step 5
        if (switch_step = 5) {
             image_xscale = 1;
             if (head = true) {
                  sprite_index = cent_up_spr;
             } else {
                  sprite_index = body_up_spr;
             }
        }
        //Step 6-9
        if (switch_step >= 6 && switch_step <= 9) {
             image_xscale = 1;
             if head=true {
                  sprite_index = cent_angle_up_spr;
             } else {
                  sprite_index = body_angle_up_spr;
             }
        }
        if switch_step = 0 then move_snap(8,8); if switch_step = 10 then move_snap(8,8);
    
    }//end switch_type = 3
    
    
    
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    ///////SWITCH_TYPE 4  Going RIGHT Cycle>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    //move_mode = 3 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    
       if switch_type = 4 {
            //sets the curved path that centipede will take
            if path_set = 1 {
                 image_xscale = 1; move_snap(1,8); path_set = 0;
                 step_x[0] = x; step_x[1] = x+1; step_x[2] = x+2; step_x[3] = x+3;
                 step_x[4] = x+4; step_x[5] = x+4; step_x[6] = x+4; step_x[7] = x+3;
                 step_x[8] = x+2; step_x[9] = x+1; step_x[10] = x
                 step_y[0] = y-8; step_y[1] = y-8; step_y[2] = y-7; step_y[3] = y-6;
                 step_y[4] = y-5; step_y[5] = y-4; step_y[6] = y-3; step_y[7] = y-2;
                 step_y[8] = y-1; step_y[9] = y; step_y[10] = y
                 switch_step = 10
            }
    
            //Path End, Change Motion
            if switch_step <= 1 {
                 switch_step = 1;
                 if (y <= 201) && (collision_point(x-9,y-4,mushroom_obj,true,true))
                  or (y <= 201) &&
                  (collision_point(x-9,y-4,side_wall_obj,true,true)) {
                       move_snap(8,8) ; move_mode = 2; vdir = 1;
                       switch_type = 4;path_set = 1
                 } else {
                       if collision_point(x-9,y-4,mushroom_obj,true,true)
                        or collision_point(x-9,y-4,side_wall_obj,true,true) {
                            move_snap(8,8); switch_type = 3; path_set = 1;
                       } else {
                            move_snap(8,8); hdir = 1; image_xscale = 1;
                            move_mode = 1; switch_step = 0; switch_type = 0;
                       }
    
                  }
            }//end Path End, Change Motion
    
       //Reduce switch_step unless smaller than 1, set it to 1
       if (switch_step - spd > 1) {
            switch_step -= spd;
       } else {
            if switch_step - spd <= 1 {
                 switch_step = 1
            }
       }
    
       //Round switch_step to apply it to the step array
       round(switch_step);
       //X and Y Values changed according to the Path
       x = step_x[switch_step]; y = step_y[switch_step];
    
       //Change to the Correct Sprite Images
       //Steps 1-3
       if (switch_step >= 1) && (switch_step <= 3) {
            image_xscale = 1;
            if (head = true) {
                 sprite_index = cent_angle_up_spr;
            } else {
                 sprite_index = body_angle_up_spr;
            }
       }
       //Steps 4-6
       if (switch_step >= 4) && (switch_step <= 6) {
            image_xscale = 1;
            if (head = true) {
                 sprite_index = cent_up_spr;
            } else {
                 sprite_index = body_up_spr;
            }
       }
       //Steps 7-9
       if (switch_step >= 7) && (switch_step <= 9) {
            image_xscale = -1;
            if (head = true) {
                 sprite_index = cent_angle_up_spr;
            } else {
                 sprite_index = body_angle_up_spr;
            }
       }
       //Move Snap at the beginning and end of the path
       if (switch_step = 0) then {move_snap(8,8)};
       if (switch_step = 10) then {move_snap(8,8)};
    
    }//end switch_type = 4
    
    
    
    }//end move_type = 3
}//End if (all_stop == true)
