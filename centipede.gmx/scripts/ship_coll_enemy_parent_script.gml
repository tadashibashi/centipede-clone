if (invincible == true) { //remove cheats eventually
     if (global.demo == false) {
          sound_play(enemy_die_snd);
     } exit;
}

global.centipede_regen = false;
with (other) {instance_destroy();}
instance_create(x-4,y,player_die_obj);


global.game_mode = 3;
instance_create(other.x+other.explodex,other.y+other.explodey,explode_obj);
if (!global.game_mode == 0 && !global.demo) {
   snd_chance = round(ceil(random(2)));
   if (snd_chance == 1) then {sound_play(player_die_snd)};
   if (snd_chance == 2) then {sound_play(player_die2_snd)};
   sound_stop(spider_snd); sound_stop(gecko_snd); sound_stop(flea_drop_snd);
   sound_stop(ship_fire_snd); sound_stop(background_bloop_snd);
}

instance_destroy();
