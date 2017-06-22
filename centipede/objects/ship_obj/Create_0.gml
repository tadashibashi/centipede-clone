//Sets the image non-animating
image_speed = 0;

//Delays the ability to shoot until 1/3 of a second into life-span
can_shoot = 0;
alarm[0] = 10; // turns can_shoot variable to 1

//Movement Related Variables
spd = 0; //ship speed variable
move_type = 9 + round(ceil(random(2)));
move_counter = 0;
mouse_dist = round(distance_to_point(mouse_x,mouse_y));
hdir = round(ceil(random(2)));
vdir = 1;
demo_max_speed = 3;

hor_lock = false; //stops movement horizontally if true
vert_lock = false; //stops movement vertically if true

//Collision test
collision = 0;
distance = 2; //distance used to check against collisions with shrooms and walls