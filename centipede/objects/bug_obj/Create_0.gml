direction = 270; //set direction downward
if global.bugs_killed < 10 vspeed = 4 //sets speed to 4 if less than 10 bugs killed
else vspeed = 6; //sets speed to 8 if more than 10 bugs killed

image_speed = 0; //image speed is 0, we use our own mechanism
anim = 0; //animation image_index variable
explodex = 0; //image_offset to create explosion
explodey = 0;

gmwPostEvent(global.EV_fleaDrop_stop,sound_controller.id);
if global.demo = false then gmwPostEvent(global.EV_fleaDrop,sound_controller.id);


