if (global.game_mode = 5) {

//If your score makes the hi-score board
if (score > highscore_value(8)) {
    draw_set_alpha(.25);
    draw_set_color(c_black)
    draw_rectangle(0,0,room_width,room_height,false)
    draw_set_alpha(1);
    draw_rectangle(8*11,8*14,8*20,8*15,false); //for "Credits 2"
    draw_rectangle(8*12,8*17,8*21,8*18,false); //for "Game Over"
    draw_rectangle(8*10,8*20,8*21,8*21,false); //for "Great Score"
    draw_rectangle(8*6,8*21,8*25,8*22,false); //for "Enter Your Initials"
    draw_rectangle(8*13,8*23,8*16,8*24,false); //for "Initials"
    script_execute(level_text_color_script);
    //a. Draw Texts
    draw_set_halign(fa_left); //Set text alignment to the left.
    draw_text(8*11,8*14,string_hash_to_newline("CREDITS 2"));//Other text.
    draw_text(8*12,8*17,string_hash_to_newline("GAME OVER"));
    draw_text(8*10,8*20,string_hash_to_newline("GREAT SCORE"));
    draw_text(8*6,8*21,string_hash_to_newline("ENTER YOUR INITIALS"));
    draw_text(8*13,8*23,string_hash_to_newline(string(string(confirmed_letter[0])+ //Draw inputted letters
    string(confirmed_letter[1])+string(confirmed_letter[2]))));
    draw_text(cursor_location*8 + 13*8,8*23,string_hash_to_newline(string(input_letter)));//Draw current potential letter

   //b. Index for the Alphabet
   if letter = -1 then input_letter = " ";
   if letter = 0 then input_letter = string("A"); if letter = 1 then input_letter = string("B");
   if letter = 2 then input_letter = string("C"); if letter = 3 then input_letter = string("D");
   if letter = 4 then input_letter = string("E"); if letter = 5 then input_letter = string("F");
   if letter = 6 then input_letter = string("G"); if letter = 7 then input_letter = string("H");
   if letter = 8 then input_letter = string("I"); if letter = 9 then input_letter = string("J");
   if letter = 10 then input_letter = string("K"); if letter = 11 then input_letter = string("L");
   if letter = 12 then input_letter = string("M"); if letter = 13 then input_letter = string("N");
   if letter = 14 then input_letter = string("O"); if letter = 15 then input_letter = string("P");
   if letter = 16 then input_letter = string("Q"); if letter = 17 then input_letter = string("R");
   if letter = 18 then input_letter = string("S"); if letter = 19 then input_letter = string("T");
   if letter = 20 then input_letter = string("U"); if letter = 21 then input_letter = string("V");
   if letter = 22 then input_letter = string("W"); if letter = 23 then input_letter = string("X");
   if letter = 24 then input_letter = string("Y"); if letter = 25 then input_letter = string("Z");
   if letter = 26 then input_letter = " ";

   //c. Controls for Inputting Initials
   if (letter < 0) then {letter = -1}; if (letter > 25) then {letter = 26}; //Keeps letters in boundaries

      //1. Keyboard Control Input
      if (keyboard_check(vk_left)) or (keyboard_check(vk_down)) {  //Gradual letter change by
            input_mode = 1; a+=b/10+2; b+=1; if (b >= 60) then {b = 60}; //using counters a, b
      }
      if (keyboard_check(vk_right)) or (keyboard_check(vk_up)) {
            input_mode = 1; a+=b/10+2;b+=1; if (b >=60) then {b = 60}
      }
      if (keyboard_check_released(vk_left)) or (keyboard_check_released(vk_right)) or  //Key release will
         (keyboard_check_released(vk_up)) or (keyboard_check_released(vk_down)) then {b = 0; a = 0;} //reset counters.

      if (a >= 20) { //Once timer is reached, check which way to add or subtract.
           a = 0; //reset timer
         if (keyboard_check(vk_left)) or (keyboard_check(vk_down)) then {letter -= 1}; //Execute change letter down
         if (keyboard_check(vk_right)) or (keyboard_check(vk_up)) then {letter += 1}; //Execute change letter up
      }

      //2. Mouse Control Input
      if (input_mode = 2) {
         dest_letter = mouse_x div (room_width div 27)
         dist_letter = abs(dest_letter - letter)
         a += dist_letter*2; //formula to set counter
         if (a >= 20) {
              a = 0; //reset counter
              if letter > dest_letter { //if mouse is to the left
                   letter -= 1   //decrease a letter
              } else {
              if letter < dest_letter { //if mouse is to the right
                   letter += 1;  //increase letter
              }
              }
        }
      }

   //d. Input Initials
   if (cursor_location <= 2) { //Make sure you are not done adding letters.
    //Enter, space, left mouse button will enter the letter.
        if keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space)
           or mouse_check_button_pressed(mb_left) {
                confirmed_letter[cursor_location] = string(input_letter) //Stores the letter.
                cursor_location += 1 //Moves cursor one space right.
        }
   }


   //e. Submit Initials
      if (cursor_location >= 3) {
          name = string(string(confirmed_letter[0]) + //Get string player just inputted
          string(confirmed_letter[1]) + string(confirmed_letter[2]));
          highscore_add(string(name),score); //Add the new hi-score using name string
          global.game_mode = 0; instance_create(120,240,ship_obj);
          global.all_stop = 0; global.game_over = 1; alarm[3] = 30*5; centipede_spawn = false
          global.demo = true;
          alarm[9] = 1; bob = 1;  exit; //Return back to pre-game state; exit event.
      }

} else {
    global.game_mode = 0; //Back to Demo Mode
    global.demo = true;
    instance_create(120,240,ship_obj); //Recreate Ship for Demo Mode
    global.game_over = 1; //Game Over has Occurred, this alerts program to draw Game Over text
    alarm[3] = 30*5; //This timer turns off Game Over variable and thus the Game Over text
    global.all_stop = false; //Game is no longer frozen
    centipede_spawn = false; //Centipede are currently not spawning
    alarm[9] = 1; bob = 1
    //Return back to pre-game state

 }//end if score makes high score board

}//end global.game_mode = 5

