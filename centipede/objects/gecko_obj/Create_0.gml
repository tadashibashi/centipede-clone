age = 0
if (global.geckos_killed < 6) {
     hspeed = 2;
} else {
     hspeed = 4; //speed of the gecko
}

if (x < 10) {
     direction = 0;
}
if (x > 200) {
     direction = 180; //sets direction
}

//If Direction is facing Right, set sprite to face right also
//Otherwise if it is facing Left, then face the sprite left as well
if (direction = 0) {
     image_xscale = -1
} else {
     image_xscale = 1
}

gecko_anim = 0 //animation step variable
explodex = -8
explodey = -2

//Play the Gecko Sound if we are not in demo mode
if (global.demo = false) then {gmwPostEvent(global.EV_gecko,sound_controller.id);}
