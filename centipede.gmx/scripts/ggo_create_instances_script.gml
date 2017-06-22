////Global Game Object INSTANCE CREATION SCRIPT/////////

//CREATE INVISIBLE BORDERS//////////////////////////////
//Block Object blocks the SHIP from moving past boundaries
  //Constant coordinates for block creation
rx = 238; //right boundary X coordinate
lx = -7; //left boundary X coordinate
uy = 192; //upper boundary Y coordinate
ly = 248; //lower boundary Y coordinate

  //create block objects
for (var i = 0; i <= 30; i++) {
    if (i <= 7) {
            //create blocks on right boundary
        instance_create(rx, uy+(i*8), block_obj);
            //create blocks on left boundary
        instance_create(lx, uy+(i*8), block_obj);
    }
      //create blocks on upper boundary
    instance_create(0 + (i*8), uy, block_obj);
      //create blocks on lower boundary
    instance_create(0 + (i*8), ly, block_obj);
}

//Create Side Walls --- side walls keep centipede in the room
instance_create(-16,0,side_wall_obj);
instance_create(room_width-8,0,side_wall_obj);

//VISIBLE OBJECTS///////////////////////////////////////
//Create Ship
instance_create(120,240,ship_obj);

//CREATE ALL THE MUSHROOMS//////////////
    //Create somewhere between 40-50 mushrooms
  for (var i = 0; i < ceil(round(random(10)))+40; i += 1) {
       //sets the X and Y coordinates randomly WITHIN room
     mush_createx = 8*ceil(round(random(30))); 
     mush_createy = 8*ceil(round(random(28))+1);
       //checks if collision at the intended coordinates to create, else no creation
     if (place_free(mush_createx,mush_createy)) {
          instance_create(mush_createx,mush_createy,mushroom_obj);
     }
  }

