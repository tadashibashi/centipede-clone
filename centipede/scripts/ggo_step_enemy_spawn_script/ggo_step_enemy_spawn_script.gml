/// @description //////////////////////////////////////////////////////////////////////////
///////CHANGING ENEMY VARIABLES//////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
//If the Gecko Variable increases, chances of geckos appearing increases
gecko = 390 - global.level * 30;
if (gecko < 150) then gecko = 150;

//If the Spider Variable increases, chances of spiders appearing increases
//The Spider variable is determined by level and a small element of randomness
spider = global.level*15 + -15 + round(ceil(random(30))); 
if (spider >= 90) then spider = 90;

if (global.level == 2) then bug_cap = 9;
if (global.level == 3) then bug_cap = 8;
if (global.level == 4) then bug_cap = 8;
if (global.level == 4) then bug_cap = 7;
if (global.level == 5) then bug_cap = 7;
if (global.level >= 6) then bug_cap = 7;

/////////////////////////////////////////////////////////////////////////////
///////SPAWN THE ENEMIES/////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
if (global.game_mode == 1) or (global.game_mode == 0) {
    ////////////////
    //FLEAS!!//////
    ///////////////
    if (global.level > 1) { //Fleas only appear after level 1
        if (bug_drop >= bug_cap - 1) {
            bug_drop = bug_cap - 1;
        }
        if (bug_drop <= 0) {
            bug_drop = 0;
        }
        if (bug_chance) {
            bug_release = round(ceil(random(bug_cap-bug_drop)));
            if (bug_release == 1) {
                //Flea creation coordinates
                bugx = round(random(232/8))*8;
                bugy = 8;
                instance_create(bugx,bugy,bug_obj);
                bug_drop = 0;
            }
            bug_chance = false;
            bug_release = 0;
        } //End if bug_chance == true
    } //End if level > 1
    
    //gecko/scorpions
    if (global.level > 3) {
        gecko_chance = ceil(round(random(gecko))); //the chance of geckos appearing
        gecko_hsnap = round(random(20)+1); //variable for height
        gecko_side = round(ceil(random(2)));
        if (gecko_side == 1) then gecko_px = room_width;
        if (gecko_side == 2) then gecko_px = -16;
        gecko_py = gecko_hsnap * 8;
        if (gecko_chance == 1) && (instance_number(gecko_obj) == 0) {
            instance_create(gecko_px,gecko_py,gecko_obj);
        }
    }
    
    if (!instance_exists(spider_obj)) {
        spider_chance = round(ceil(random(30*4-spider)))
        spider_side = round(ceil(random(2)));
        if (spider_side == 1) then spider_px = room_width+8;
        if (spider_side == 2) then spider_px = -8;
        if (spider_chance == 1) then instance_create(spider_px,152,spider_obj);
    }
    
     if (global.centipede_regen == 1) {
        cent_regen_counter += 1;
        cent_regen_cap = 120;
        if (cent_regen_counter >= cent_regen_cap) {
            cent_regen_counter = 0;
            cent_side = round(ceil(random(2)));
            if (cent_side == 1) then cent_px = room_width;
            if (cent_side == 2) then cent_px = -4;
            instance_create(cent_px,192,centipede_obj);
            if (cent_regen_cap > 30) then cent_regen_cap -= 20 else cent_regen_cap = 30;
        }
    }
    
    if (!instance_exists(centipede_obj)) && (centipede_in == true) {
          global.level += 1;
          gmwPostEvent(global.EV_bgBloop_stop, sound_controller.id);
          centipede_spawn_created = 0;
          cent_regen_counter = 0;
          alarm[6] = 30; //begin spawn centipede code
          centipede_in = false;
          global.centipede_regen = false;
    }
    
    
    if (global.level > level_old) then even_or_odd_level += global.level - level_old;
    level_old = global.level;
    if (even_or_odd_level >= 3) then even_or_odd_level = 1;
    if (even_or_odd_level == 1) then gap_cap = 2;
    if (even_or_odd_level == 2) then gap_cap = 4;
    
    if (centipede_spawn == true) {
        gap += 1;
        if (gap >= gap_cap) && (cent_spawn_created < connected_centipede) {
            gap = 0;
            cent_spawn_created += 1
            instance_create(120,0,centipede_obj);
            centipede_in = true;
            var cent_createx;
            cent_createx = 0;
        if (other_centipede > 0) {
            if (cent_spawn_created == 1) {
                for (i = 0; i < other_centipede; i ++) {
                    if (even_or_odd_level == 1) {
                        instance_create(cent_createx,0,centipede_obj);
                    }
                    if (even_or_odd_level == 2) {
                        instance_create(232-cent_createx,0,centipede_obj);
                    }
                    cent_createx += 16;
                }
            }
        }
    
        }
        if (cent_spawn_created >= connected_centipede) {
         centipede_spawn = false;
         cent_createx = 0;
        }
    
    } // End if centipede_spawn == true

} //End if game_mode = 1 or 0



