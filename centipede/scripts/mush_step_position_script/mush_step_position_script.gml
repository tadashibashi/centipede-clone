//MAP PLACEMENT AND IMAGE PARAMETERS///////////////////////////
  //snaps mushroom to the grid at all times
move_snap(8,8); 
  //destroys self if in the bottom row
if (y >= 240) {
	instance_destroy();
} 
  //sets the correct mushroom color of still subimage
image_index = (global.level-1)*4 + (4 - life);


/* EXISTENCE VARIABLE//////////////////////////////////////////
This variable is a check that prevents mushrooms from stacking 
on top of each other. New mushrooms start at exist_counter = 0. 
If overlapping with mushroom that already exists, (older object's 
exists_counter would be higher by then), then the new one gets destroyed
*//////////////////////////////////////////////////////////////
if (exist_counter < 2) {
    exist_counter += 1;
}