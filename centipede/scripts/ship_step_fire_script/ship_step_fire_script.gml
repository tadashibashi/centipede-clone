if (can_shoot == 0) then exit;
if (global.all_stop) {
     exit;
}

if (mouse_check_button(mb_left)) or (keyboard_check(vk_space)) {

     if (global.game_mode = gameMode.game) { //Fire only during gameplay
          if (instance_number(laser_obj) == 0) { //Fire only when no bullets onscreen
               gmwPostEvent(global.EV_shipFire,sound_controller.id); //play fire sound
               instance_create(x,y-2,laser_obj); //create laser fire object
          }
     }
}

