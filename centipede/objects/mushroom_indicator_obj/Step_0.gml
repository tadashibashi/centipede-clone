if (!global.game_mode == 3) { 
	instance_destroy(); //if mushroom healing mode is not happening, destroy self
}

if (!instance_exists(need_heal_obj2)) {
	global_game_obj.shoot_mushrooms = 1; 
	instance_destroy(); 
	exit;
}

if (activate == 1) {
	alarm[0]=4;
	activate = 0;
	instance_create(instance_nearest(x,y,need_heal_obj2).x,
		instance_nearest(x,y,need_heal_obj2).y, mushroom_repair_obj);
	exit;
}