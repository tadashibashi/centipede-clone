if (global.game_mode == 1) {
//PAUSE////////////////////////////////////////////////////
 if (pause == true) {
   vol = 0;
   sound_volume(gecko_snd,vol); sound_volume(cricket_snd,vol);
   sound_volume(flea_drop_snd,vol); sound_volume(ship_fire_snd,vol);
   sound_volume(spider_snd,vol); sound_volume(power_up1,vol);
   sound_volume(background_bloop_snd,vol);
   sound_volume(player_die_snd,vol); sound_volume(player_die2_snd,vol);
   sound_volume(enemy_die_snd,vol); alarm[7] = 60;

   draw_set_alpha(.25);
   draw_set_color(c_black);
   draw_rectangle(0,0,room_width,room_height,false);
   draw_set_alpha(1);
   draw_set_halign(fa_left);
   draw_set_color(c_black);
   draw_rectangle(13*8,15*8,18*8,16*8,false);
   script_execute(level_text_color_script);
   draw_text(13*8,15*8,"PAUSE");
  } else {
   if (vol < 1) then {vol += .033}; if (vol >= 1) then {vol = 1};
  }
  if (!global.cheating) {
      draw_set_halign(fa_left);
      script_execute(level_text_color_script);
      if (ship_obj.invincible) {
        draw_text(2,248,"INVINCIBLE" + " " + string(global.power_up_timer div 30));
      }
      if (global.mushroom_hunter) {
        draw_text(2,248,"MUSHROOM HUNTER" + " " + string(global.power_up_timer div 30));
      }
  }


}
