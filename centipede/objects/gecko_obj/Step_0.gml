//If global.all_stop = false then animate sprite
//If it is true stop the object motion
if (global.all_stop = false) {
     gecko_anim += .5
} else {
     speed = 0
}

//reset animation when cycle is complete
if (gecko_anim >= 4) then {gecko_anim = 0};

//set image index to the right color and part in the animation
image_index = gecko_anim + (global.level-1)*4

//age counter keeps track of how long existed
age += 1

//Destroy Self if off of the screen
if (age >= 30) { //after aged 1 second
     if (x > 240) or (x < -16) {
          instance_destroy();
     }
}


