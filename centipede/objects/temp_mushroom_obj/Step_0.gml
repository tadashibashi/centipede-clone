self_destruct_counter += 1;

if (self_destruct_counter >= 10) {
     instance_destroy();
}

if (collision_point(x,y,centipede_obj,true,true)) {
     self_destruct_counter = 0;
}

