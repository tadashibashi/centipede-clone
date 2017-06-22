if (global.game_mode == gameMode.game) {
	  //PAUSE
	if (pause == true) {
		vol = 0;
		alarm[7] = 60;

		draw_set_alpha(.25);
		draw_set_color(c_black);
		draw_rectangle(0,0,room_width,room_height,false);
		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_set_color(c_black);
		draw_rectangle(13*8,15*8,18*8,16*8,false);
		script_execute(level_text_color_script);
		draw_text(13*8,15*8,string_hash_to_newline("PAUSE"));
	} else {
		if (vol < 1) {
			vol += .033;
		} 
		if (vol >= 1) {
			vol = 1;
		}
	}
}
