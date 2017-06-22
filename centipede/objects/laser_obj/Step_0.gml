image_index=global.level-1;

if ((collision_line(x+3,y+8,x+3,y-16,mushroom_obj,true,true)) ||
	(collision_line(x+3,y+8,x+3,y-16,enemy_parent,true,true)))  {
	y-= 8; 
	move_snap(1,4); 
	global.pizza = 1;
} else {
	y-= 15; 
	global.pizza = 0;
}

if instance_exists(ship_obj) {
	if (y > ship_obj.y - 8) { 
		move_outside_solid(90,8);
	}
} else {
	instance_destroy();
}

//GMS2 Conversion
var g;
g = action_if_variable(y, -8, 1);
if (g) {
action_kill_object();
}
