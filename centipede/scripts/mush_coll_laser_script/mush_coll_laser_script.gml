//PREVENT FAULTY COLLISIONS//////////////////////////////////
  //Prevent two mushrooms from being destroyed simultaneously
if (collision_line(x+4,y+10,x+4,y+4,mushroom_obj,true,true)) {
	other.y = other.y + 8; exit;
}
  //If Ship does not exist, exit event.
if (!instance_exists(ship_obj)) {
   exit;
 }

  //When Ship is above mushroom, exit event
  //aka no mysterious destruction of mushrooms from behind
if (ship_obj.y < y) {
	exit;
}

//DAMAGE DEALT//////////////////////////////////////////////
  //Life minus 1
life --;
  //Destroy the laser_obj
with (other) instance_destroy(); 


