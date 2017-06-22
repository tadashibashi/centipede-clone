anim += anim_speed;
if (anim > 6) {
	instance_destroy();
}

image_index = (global.level-1)*6 + anim;