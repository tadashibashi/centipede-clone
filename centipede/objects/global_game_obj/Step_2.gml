//Detect if the mouse position has changed to determine the input mode to mouse (2)
//This is used for global.game_mode = 5 when you are inputting your high score
if (global.game_mode == gameMode.hiScore) {
	if (mouse_x <> oldx) || (mouse_y <> oldy) { 
		input_mode = 2;
	}
	  //counter
	b += 1; 

	if (b >= 5) { //once it hits 60 aka. 2 seconds
	     oldx = mouse_x;  //update old data to current
	     oldy = mouse_y;
	     b = 0; //reset counter
	}
}

/////////RESET THE ARRAY EVERY END STEP///////////////////
//This is to see if objects have moved to new locations
//such as the centipede

var i, j; //initialize variables
  //Set all grid areas to 0 thus resetting locations to
  //be recalculated at the beginning of the next step
for (i = 0; i <= room_width div 8 + 4; i += 1) {
    for (j = 0; j <= room_height div 8 + 4; j += 1) {
     cells[i,j] = 0;
    }
}
