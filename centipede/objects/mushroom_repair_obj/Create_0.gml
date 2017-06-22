anim = 0;   
anim_speed = 2;

if (!global.demo) {
	gmwPostEvent(global.EV_enemyDie,sound_controller.id);
}

image_index = (global.level-1)*6 + anim;

