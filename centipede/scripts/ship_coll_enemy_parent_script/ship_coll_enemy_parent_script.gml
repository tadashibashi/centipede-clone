global.centipede_regen = false;
with (other) {instance_destroy();}
instance_create(x-4,y,player_die_obj);


global.game_mode = gameMode.mush;
instance_create(other.x+other.explodex,other.y+other.explodey,explode_obj);
if (!global.game_mode == 0 && !global.demo) {
	  //play enemy die sound
	gmwPostEvent(global.EV_playerDie,sound_controller.id);
	  //stop enemy sounds
	gmwPostEvent(global.EV_spider_stop,sound_controller.id); 
	gmwPostEvent(global.EV_gecko_stop,sound_controller.id);  
	gmwPostEvent(global.EV_fleaDrop_stop,sound_controller.id);
	gmwPostEvent(global.EV_bgBloop_stop,sound_controller.id);
}

instance_destroy();
