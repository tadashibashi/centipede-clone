//This code draws everything needed during different game modes
//TABLE OF CONTENTS
//I. Sets Font and Color Constants (All Times)
//II. Draw At All Times (All Times)
//   a. Score
//   1. 1 Player Mode Score Display Settings (shows all times anyway)
//   2. 2 Player Mode Score Display Settings
//III. Drawings During Demo Play (global.game_mode = 0)
//   a. Draw Hi-Scores: Values
//   b. Draw Hi-Scores: Names
//   c. Draw Atari Copyright
//   d. Draw Other Text
//IV. Input Hi-Score End-Game (global.game_mode = 5)
//   a.
//   b. Index for the Alphabet
//   c. Controls for Inputting Hi-Score
//      1. Keyboard Control Input
//      2. Mouse Control Input
//   d. Input Initials
//   e. Submit Initials / Return to Demo Play


/////////////////////////////////////////////////
//I. II. (All Times)///
////////////////////////////////////////////////
script_execute(ggo_draw_all_times_script);

/////////////////////////////////////////////////////
//III. Drawings During Demo Play (global.game_mode = 0)
//////Hi-Score, Logo, Other Text////////////////////
script_execute(ggo_draw_demo_script);
//Pause
script_execute(ggo_draw_pause_script);

///////////////////////////////////////////////////////////
//IV. Input Hi-Score End-Game (global.game_mode = 5)///////
///////////////////////////////////////////////////////////
script_execute(ggo_draw_end_game_script);





