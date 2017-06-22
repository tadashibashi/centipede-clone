if (can_shoot == 0) then exit;
if (global.all_stop) {
     exit;
}

if (mouse_check_button(mb_left)) or (keyboard_check(vk_space)) {

     if (global.game_mode = gameMode.game) { //Fire only during gameplay
          if (instance_number(laser_obj) == 0) { //Fire only when no bullets onscreen
               if (sound_isplaying(ship_fire_snd)) {
                    sound_stop(ship_fire_snd); //ensures only one ship_fire_snd playing
               }
               sound_play(ship_fire_snd); //play fire sound
               instance_create(x,y-2,laser_obj); //create laser fire object
          }
     }
}

