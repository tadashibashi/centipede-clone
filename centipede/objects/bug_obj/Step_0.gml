if (global.all_stop = true) then {speed = 0; exit} //all_stop stops code if true
depth = -y
anim += .5; if anim >= 3 then anim = 0 //resets the animation once complete
image_index = anim + ((global.level-1)*4)// sets the image_index to level color

//if ship_obj comes underneath then speed up
if collision_line(x+4,y,x+4,248,ship_obj,true,true) {
  if (global.bugs_killed >= 10) then speed = 8
  if (global.bugs_killed < 10) then speed = 6
}
//If OffScreen
if y >= 240 {
   global_game_obj.bug_drop += 3
   b = round(ceil(random(4)))
if (b >= 0) && (b < 4) then {global_game_obj.bug_chance = true};
   gmwPostEvent(global.EV_fleaDrop_stop,sound_controller.id);; instance_destroy();
}

drop_m = round(ceil(random(6)))
if (drop_m = 1) && (place_empty(x,y)) && y >= 8 && y <= 232 then {instance_create(x,y,mushroom_obj);}



