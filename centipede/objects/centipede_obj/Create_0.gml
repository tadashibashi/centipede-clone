//Head is true if the first one spawned
if (instance_number(centipede_obj) == 1) {
     head = true;
} else {
     head = false;
}

image_speed = 0;

dont_check_head = true;

//Variables used for Avoiding Collisions with other Centipede
can_move = true; //trigger used for collisions with other centipede
age = 0; //age of centipede
go_down = false;
collision_time = 0;


//Offset Animation
if (global_game_obj.cent_spawn_created > 8) {
     anim = global_game_obj.cent_spawn_created - 8;
} else {
     anim = global_game_obj.cent_spawn_created;
}

//Set animation variables
sprite_old = sprite_index; image_speed = 0; cent_anim = 0; cent_anim2 = 0;
//Set Image Index
image_index = cent_anim + ((global.level-1)*8);
//Location where explosion should happen
explodex = -2; explodey = 0;

//Direction and Motion Orientation Initiation
//When Spawned from RIGHT during Regeneration
if (y = 192) && (x >= room_width) {
     hdir = 1; image_xscale = 1; move_mode = 1; vdir = 1;
     if (global_game_obj.even_or_odd_level == 1) then {spd = 4};
     if (global_game_obj.even_or_odd_level == 2) then {spd = 2};
} else { //When Spawned from LEFT during Regeneration
     if (y = 192) && (x < 0) {
          hdir = 2; image_xscale = -1; move_mode = 1; vdir = 1;
          if (global_game_obj.even_or_odd_level == 1) then {spd = 4};
          if (global_game_obj.even_or_odd_level == 2) then {spd = 2};
     } else { //When Spawned from ceiling on middle or left
          if (x < 120 && y < 16) or (x > 120 && y < 16) {
               c = round(ceil(random(2)));
               if (c == 1) {
                    hdir = 2; vdir = 1; move_mode = 2; image_xscale = -1;
                    switch_type = 3; path_set = 1; spd = 4;
               }
               if (c == 2) {
                    hdir = 1; vdir = 1; move_mode = 2; image_xscale = 1;
                    switch_type = 4; path_set = 1; spd = 4;
               }
          } else {
               if (x == 120) && (y < 16) {
                    hdir = 2; vdir = 1; move_mode = 2; image_xscale = -1;
                    switch_type = 3; path_set = 1;
                    if (global_game_obj.even_or_odd_level == 1) then {spd = 4};
                    if (global_game_obj.even_or_odd_level == 2) then {spd = 2};
               } else {
                    move_mode = 1; hdir = 1; vdir = 1; image_xscale = -1;
                    if (global_game_obj.even_or_odd_level == 1) then {spd = 4};
                    if (global_game_obj.even_or_odd_level == 2) then {spd = 2};
               }
          }
     }
}

move_snap(8,8);
super_mushroom = false;
switch_step = 0;

