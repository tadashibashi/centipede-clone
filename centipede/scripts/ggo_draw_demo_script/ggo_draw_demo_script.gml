if (global.game_mode = 0) or (global.demo)  {
    draw_set_color(c_black);
    if (bob == 1) then {draw_rectangle(8*6,8*19,8*26,8*20,false);}
    script_execute(level_text_color_script);
       //a. Draw Hi-Scores: Values
    draw_set_halign(fa_right);
    draw_text(21*8,8*3,string_hash_to_newline("HIGH SCORES"));
    draw_text(16*8,8*4,string_hash_to_newline(highscore_value(1)));
    draw_text(16*8,8*5,string_hash_to_newline(highscore_value(2)));
    draw_text(16*8,8*6,string_hash_to_newline(highscore_value(3)));
    draw_text(16*8,8*7,string_hash_to_newline(highscore_value(4)));
    draw_text(16*8,8*8,string_hash_to_newline(highscore_value(5)));
    draw_text(16*8,8*9,string_hash_to_newline(highscore_value(6)));
    draw_text(16*8,8*10,string_hash_to_newline(highscore_value(7)));
    draw_text(16*8,8*11,string_hash_to_newline(highscore_value(8)));
        //b. Draw Hi-Scores: Names
    draw_set_halign(fa_left);
    draw_text(17*8,8*4,string_hash_to_newline(highscore_name(1)));
    draw_text(17*8,8*5,string_hash_to_newline(highscore_name(2)));
    draw_text(17*8,8*6,string_hash_to_newline(highscore_name(3)));
    draw_text(17*8,8*7,string_hash_to_newline(highscore_name(4)));
    draw_text(17*8,8*8,string_hash_to_newline(highscore_name(5)));
    draw_text(17*8,8*9,string_hash_to_newline(highscore_name(6)));
    draw_text(17*8,8*10,string_hash_to_newline(highscore_name(7)));
    draw_text(17*8,8*11,string_hash_to_newline(highscore_name(8)));
        //c. Draw Atari Copyright
    draw_text(8*10,8*31,string_hash_to_newline(" 1980 ATARI"));
    draw_sprite(copyright_spr,global.level-1,8*10,8*31);
		// Audio Powered by Wwise Text
	draw_text(8*7, 8*29, "AUDIO POWERED BY"); 
	draw_text(8*6, 8*30, "AUDIOKINETIC WWISE");
    
        //d. Draw Other Text
    draw_text(8*10,8*14,string_hash_to_newline("CREDITS 2"));
    draw_text(8*7,8*15,string_hash_to_newline("BONUS EVERY 12000"));
    if (bob == 1) {draw_text(8*6,8*19,string_hash_to_newline("PRESS SPACE TO START"))}
        //Draws Game Over if Player just got a Game Over
    if (global.game_over == 1) {
        draw_set_color(c_black);
        draw_rectangle(8*11,8*17,8*20,8*18,false);
        script_execute(level_text_color_script);
        draw_text(8*11,8*17,string_hash_to_newline("GAME OVER"));
    }

} //End if game_mode = 0 or demo is true

