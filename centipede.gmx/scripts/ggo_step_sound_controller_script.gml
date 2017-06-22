//sound volume determined by vol
sound_volume(gecko_snd,vol); sound_volume(cricket_snd,vol);
   sound_volume(flea_drop_snd,vol); sound_volume(ship_fire_snd,vol);
   sound_volume(spider_snd,vol); sound_volume(power_up1,vol);
   sound_volume(background_bloop_snd,vol);
   sound_volume(player_die_snd,vol); sound_volume(player_die2_snd,vol);
   sound_volume(enemy_die_snd,vol);

if (sound_isplaying(gecko_snd)){ 
    sound_volume(background_bloop_snd,0);
} else {
    sound_volume(background_bloop_snd,1);
}
