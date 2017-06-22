// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = -1000; // global_game_obj
global.__objectDepths[1] = -5; // ship_obj
global.__objectDepths[2] = 0; // laser_obj
global.__objectDepths[3] = 0; // explode_obj
global.__objectDepths[4] = 0; // player_die_obj
global.__objectDepths[5] = 1; // mushroom_obj
global.__objectDepths[6] = 0; // super_mushroom_obj
global.__objectDepths[7] = 0; // enemy_parent
global.__objectDepths[8] = -200; // centipede_obj
global.__objectDepths[9] = 0; // gecko_obj
global.__objectDepths[10] = -2; // bug_obj
global.__objectDepths[11] = 0; // spider_obj
global.__objectDepths[12] = 0; // mushroom_eater_obj
global.__objectDepths[13] = 0; // need_heal_obj
global.__objectDepths[14] = 0; // need_heal_obj2
global.__objectDepths[15] = 0; // mushroom_healer_shooter
global.__objectDepths[16] = 0; // healer_obj
global.__objectDepths[17] = 0; // mushroom_repair_obj
global.__objectDepths[18] = 0; // mushroom_indicator_obj
global.__objectDepths[19] = 0; // block_obj
global.__objectDepths[20] = 0; // topscreen_obj
global.__objectDepths[21] = -1; // invis_mushroom_obj
global.__objectDepths[22] = 0; // temp_mushroom_obj
global.__objectDepths[23] = 0; // side_wall_obj
global.__objectDepths[24] = -10000; // cheat_info_obj


global.__objectNames[0] = "global_game_obj";
global.__objectNames[1] = "ship_obj";
global.__objectNames[2] = "laser_obj";
global.__objectNames[3] = "explode_obj";
global.__objectNames[4] = "player_die_obj";
global.__objectNames[5] = "mushroom_obj";
global.__objectNames[6] = "super_mushroom_obj";
global.__objectNames[7] = "enemy_parent";
global.__objectNames[8] = "centipede_obj";
global.__objectNames[9] = "gecko_obj";
global.__objectNames[10] = "bug_obj";
global.__objectNames[11] = "spider_obj";
global.__objectNames[12] = "mushroom_eater_obj";
global.__objectNames[13] = "need_heal_obj";
global.__objectNames[14] = "need_heal_obj2";
global.__objectNames[15] = "mushroom_healer_shooter";
global.__objectNames[16] = "healer_obj";
global.__objectNames[17] = "mushroom_repair_obj";
global.__objectNames[18] = "mushroom_indicator_obj";
global.__objectNames[19] = "block_obj";
global.__objectNames[20] = "topscreen_obj";
global.__objectNames[21] = "invis_mushroom_obj";
global.__objectNames[22] = "temp_mushroom_obj";
global.__objectNames[23] = "side_wall_obj";
global.__objectNames[24] = "cheat_info_obj";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for