//Cycle the centipede animation variables
if (cent_anim >= 7) then {cent_anim = 0};
if (cent_anim2 >= 3) then {cent_anim2 = 0};

if (global.all_stop) {
     exit;
}

//Set sprite counter according to sprite_index
//Increase the corresponding sprite counter
if (sprite_index == cent_forward_spr) or (sprite_index == body_forward_spr) {
     cent_anim += .5; image_index = cent_anim + ((global.level-1)*8);
}

if (sprite_index == cent_angle_spr) or (sprite_index == body_angle_spr)
 or (sprite_index == cent_angle_up_spr) or (sprite_index == body_angle_up_spr)
 or (sprite_index == cent_down_spr) or (sprite_index == cent_up_spr)
 or (sprite_index == body_down_spr) or (sprite_index == body_up_spr) {
      cent_anim2 += .5; image_index = cent_anim2 + ((global.level-1)*4);
}

//age determines which centipedes are connected
//it senses if the age of another centipede is different by too much
//to be connected to the other

if (move_mode == 1) then {age  += 1};
if (move_mode == 2) then {age  += 2};
if (move_mode == 3) then {age  += 2};

if (!collision_point(x,y,centipede_obj,true,false)) then {collision_time = 0};



