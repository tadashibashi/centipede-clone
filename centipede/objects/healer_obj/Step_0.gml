if (collision_line(x,y,x,y+256,need_heal_obj,true,false)) {
 instance_create(x,y,mushroom_healer_shooter);
}

if (x > room_width + 50) {
	global_game_obj.shoot_mushrooms = 1; 
	instance_destroy();
}

