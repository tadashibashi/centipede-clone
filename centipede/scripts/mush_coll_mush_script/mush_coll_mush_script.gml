//The exist_counter is increased to two by step after creation
//This prevents younger newly created mushrooms from overlapping, in which case they
//are destroyed. These cases includes centipedes spawning mushrooms upon their
//deaths, and fleas from dropping overlapping mushrooms
if (other.exist_counter < 2) {
   with (other) instance_destroy();
}

