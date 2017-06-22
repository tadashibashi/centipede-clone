//////////////////////////////////////////////////////////////
//Check at All Times//////////////////////////////////////////
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////

if (collision_rectangle(x-6,y-6,x+14,y+14,block_obj,true,true)) {
     speed = 1; move_snap(1,1); move_outside_solid(direction+180,8);
}

if (!place_meeting(x,y+2,block_obj)) && (!place_meeting(x,y-2,block_obj))
&& (!place_meeting (x+2,y,block_obj)) && (!place_meeting(x-2,y,block_obj)) {
     collision = false;
}
//sets right color according to level
//if invincible, then rainbow colors!
if (invincible == false) {image_index = global.level-1; image_speed = 0};
if (invincible == true) then {image_speed = 1};


////Check Freedom of Movement in Game Play Mode////
if (global.demo = false) {
   //Check For Horizontal Collisions
           //LEFT check
if (mouse_x < x) && (place_meeting(x-distance-4,y,block_obj)) { //left, with block
     hor_lock = true; collision = true; move_type = 2; move_snap(8,1)
} else {
     if (mouse_x < x) && !(place_meeting(x-distance-4,y,block_obj)) { //left, no block
          hor_lock = false;
     } else {
          if !(mouse_x < x) && (place_meeting(x-distance-4,y,block_obj)) { //mouse not left, block left
               hor_lock = false;
          }
     }
}

           //RIGHT check
if (mouse_x > x) && (place_meeting(x+distance+4,y,block_obj)) { //right, with block
     hor_lock = true; collision = true;move_type = 2;move_snap(8,1)
} else {
     if (mouse_x > x) && !(place_meeting(x+distance+4,y,block_obj)) { //right, no block
          hor_lock = false;  //can move horizontally
     } else {
          if !(mouse_x > x) && (place_meeting(x+distance+4,y,block_obj)) { //mouse not right, block right
               hor_lock = false;  //can move horizontally
          }
     }
}

   //Check for Vertical Collisions
           //UP check
if (mouse_y < y) && (place_meeting(x,y-distance-4,block_obj)) { //up, with block
     vert_lock = true; collision = true; move_type = 3; move_snap(1,8);
} else {
     if (mouse_y < y) && !(place_meeting(x,y-distance-4,block_obj)) { //up, no block
          vert_lock = false;  //can move vertically
     } else {
          if !(mouse_y < y) && (place_meeting(x,y-distance-4,block_obj)) { //mouse not up, with block
               vert_lock = false; //can move vertically
          }
     }
}
           //DOWN check
if (mouse_y > y) && (place_meeting(x,y+distance+4,block_obj)) { //down, with block
     vert_lock = true; collision = true; move_type = 3; move_snap(1,8)
} else {
     if (mouse_y > y) && !(place_meeting(x,y+distance+4,block_obj)) { //down, no block
          vert_lock = false //can move vertically
     } else {
          if !(mouse_y > y) && (place_meeting(x,y+distance+4,block_obj)) { //mouse not down, with block
               vert_lock = false;
          }
     }
}

}//end global.demo = false



//////////////////////////////////////////////////////////////
//Pre-game Demo//////////////////////////////////////////////
//global.game_mode = 0////////////////////////////////////////
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////

if (global.demo) {
     //always fire laser when there is no laser currently being fired
     if (instance_number(laser_obj) == 0) {
          instance_create(x,y-2,laser_obj);
     }
     //Set the direction depending on ship location
     if (x >= 224) then {x = 224; hdir = 1;}
     if (x <= 8) then {x = 8; hdir = 2;}
     if (y >= 236) then {y = 236; vdir = 1;}
     if (y <= 200) then {y = 200; vdir = 2;}
     //Set the trajectory depending on its direction
     if (hdir = 1) && (vdir = 1) then {destination_x = x-10; destination_y = y-10}
     if (hdir = 2) && (vdir = 2) then {destination_x = x+10; destination_y = y+10}
     if (hdir = 1) && (vdir = 2) then {destination_x = x-10; destination_y = y+10}
     if (hdir = 2) && (vdir = 1) then {destination_x = x+10; destination_y = y-10}

     if (global.all_stop) then {speed = 0; exit;}
     destination_dist = round(distance_to_point(destination_x,destination_y)) //sets the variable mouse_dist
     //Execute the move phases during demo mode
     if (move_type == 10) { //This phase moves for 2 seconds and goes to move_type 11
          move_counter += 1; //This is a timer variable for moving/waiting
          spd = round(destination_dist*3/4); //The ship_obj speed
          if (spd > demo_max_speed) then {spd = demo_max_speed};
          move_towards_point(destination_x,destination_y,spd); //Moves toward set location
          if (move_counter >= 60) then {move_counter = 0; move_type = 11;} //Resets counter at 2 Sec, switch move_type
     }

     if (move_type == 11) { //This phase stops for 2 seconds and goes back to move_type 10
          move_counter +=1 //Timer variable for moving/waiting
          speed = 0 //Stops your movement
          if move_counter >= 60 then {move_counter = 0; move_type = 10;} //Resets counter at 2 Sec, switch move_type
     }
     if (move_type == 12) {
          move_counter += 1; //This is a timer variable for moving/waiting
          move_towards_point(x,destination_y,spd)
          spd = 4
          if (spd > demo_max_speed) then {spd = demo_max_speed};
          if (move_counter >= 60) then {move_counter = 0; move_type = 11;}
     }
     if (move_type == 13) {
          spd = 4
          move_counter += 1; //This is a timer variable for moving/waiting
          move_towards_point(destination_x,y,spd)
          if (spd > demo_max_speed) then {spd = demo_max_speed};
          if (move_counter >= 60) then {move_counter = 0; move_type = 11};
     }

////Check Freedom of Movement in demo Mode////
     //Check For Horizontal Collisions
     //LEFT check
     if (destination_x < x) && (place_meeting(x-distance-4,y,block_obj)) { //left, with block
          hor_lock = true; collision = true; move_snap(8,1);
          if (move_type == 10) {
               move_type = 12;
          }
     } else {
          if (destination_x < x) &&
          (not place_meeting(x-distance-4,y,block_obj)) { //left, no block
               hor_lock = false;
          } else {
               if (not destination_x < x) &&
               (place_meeting(x-distance-4,y,block_obj)) { //mouse not left, block left
                   hor_lock = false;
               }
          }
     }

     //RIGHT check
     if (destination_x > x) && (place_meeting(x+distance+4,y,block_obj)) { //right, with block
          hor_lock = true; collision = true; move_snap(8,1);
          if (move_type == 10) {
               move_type = 12;
          }
     } else {
          if (destination_x > x) &&
          (not place_meeting(x+distance+4,y,block_obj)) { //right, no block
               hor_lock = false;  //can move horizontally
          } else {
               if (not destination_x > x) &&
               (place_meeting (x+distance+4,y,block_obj)) { //mouse not right, block right
                    hor_lock = false;  //can move horizontally
               }
          }
     }

     //Check for Vertical Collisions
     //UP check
     if (destination_y < y) && (place_meeting(x,y-distance-1,block_obj)) { //up, with block
          vert_lock = true; collision = true; move_snap(1,8)
          if (move_type == 10) {
               move_type = 13;
          }
     } else {
          if (destination_y < y) &&
          (not place_meeting(x,y-distance-1,block_obj)) { //up, no block
               vert_lock = false;  //can move vertically
          } else {
               if (not destination_y < y) &&
               (place_meeting(x,y-distance-1,block_obj)) { //mouse not up, with block
                    vert_lock = false; //can move vertically
               }
          }
     }

           //DOWN check
     if (destination_y > y) && (place_meeting(x,y+distance+4,block_obj)) {//down, with block
          vert_lock = true; collision = true; move_snap(1,8)
          if (move_type == 10) {
               move_type = 13;
          }
     } else {
          if (destination_y > y) &&
          (not place_meeting(x,y+distance+4,block_obj)) { //down, no block
               vert_lock = false //can move vertically
          } else {
               if (not destination_y > y) &&
               (place_meeting(x,y+distance+4,block_obj)) { //mouse not down, with block
                    vert_lock = false;
               }
          }
     }


     if (collision == false) {
          if (move_type == 12) or (move_type == 13) {
               move_type = 10;
          }
     }

     if (spd > demo_max_speed) {
          spd = demo_max_speed;
     }

}//end global.demo = true


//////////////////////////////////////////////////////////////
//Game-Play///////////////////////////////////////////////////
//global.game_mode = 1////////////////////////////////////////
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
if (global.game_mode == 1) {

     //Cut off this code if global.all_stop is true
     if (global.all_stop = true) then {speed = 0; exit;}

     //Check Mouse Distance from Ship
     //this code corrects the jerky-motion bug that move_towards_point causes
     mouse_dist = round(distance_to_point(mouse_x,mouse_y)) //sets the variable mouse_dist

     //Calculate the spd of the Ship depending on what move_type it is in
     if (move_type = 1) then {spd = round(mouse_dist*3/4)};
     if (move_type = 2) then {spd = round(abs(mouse_y-y)*3/4)};
     if (move_type = 3) then {spd = round(abs(mouse_x-x)*3/4)};

     //Max Speed during gameplay is 8
     if (global.demo = false) {
          if (spd > 8) {
               spd = 8
          }
     }
      //X and Y axis boundaries for ship
     if (x >= 232) then {x = 232}; if (x <= 0) then {x = 0};
     if (y >= 240) then {y = 240}; if (y <= 200) then {y = 200};

     //Stop movement and align to mouse if close by mouse
     //otherwise move towards mouse
     if (mouse_dist <= 4) && (collision = false) { //if ship is in very close range
          speed = 0; x=mouse_x; y=mouse_y; //set speed to 0 & align ship to mouse
     } else {
          if (mouse_dist <= 4) && (y >=240) {
               speed = 0; x=mouse_x; y=mouse_y
          } else {
               if (collision = true) && (mouse_dist <= 4) && (y <= 200) {
                    speed = 0; x=mouse_x; y=mouse_y;
               } else {
                    if (collision = true) && (mouse_dist <= 4) && (x <= 0) {
                         speed = 0; x=mouse_x; y=mouse_y;
                    } else {
                         if (collision = true) && (mouse_dist <= 4) && (x >= 232) {
                              speed = 0; x=mouse_x; y=mouse_y;
                         } else {  //otherwise continue mouse pursuit
                              move_towards_point(mouse_x,mouse_y,spd);
                         }
                    }
               }
          }
     }


     move_snap(1,1);

    //If Ship is hitting horizontal boundaries set the direction
     if (x >= 240) && (mouse_x >= 240) or (x <= 0) && (mouse_x <= 0) {

          move_type = 2;

          if (mouse_y > y) && (!place_meeting(x,y+distance,block_obj)) {
               direction = 270;
          }
          if (mouse_y < y) && (!place_meeting(x,y-distance,block_obj)) {
               direction = 90;
          }

     } else {
          //If Ship is hitting the vertical boundaries set the direction
          if (y >= 236) && (mouse_y >= 236) or (y <= 200) && (mouse_y <= 200) {
               vmove = 1;
               if (mouse_x > x) && (!place_meeting(x+distance,y,block_obj)) {
                    direction = 0;
               }
              if (mouse_x < x) && (!place_meeting(x-distance,y,block_obj)) {
                   direction = 180;
              }

          move_type = 3;

          } else {
               move_type = 1;
          }
     }

     //Sets the speed when locked in certain directions
     if (hor_lock = 1) && (vert_lock = 1) {
          hspeed = 0; vspeed = 0; move_outside_solid(direction+180,4);
     }
     if (hor_lock = 1) && (vert_lock = 0) {
          hspeed = 0;
     }
     if (hor_lock = 0) && (vert_lock = 1) {
          vspeed = 0;
     }


}//end global.game_mode = 1

//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
//global.game_mode = 2////////////////////////////////////////
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////


