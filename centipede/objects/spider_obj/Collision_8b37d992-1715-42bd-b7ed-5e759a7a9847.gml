//Spider Death


instance_create(x-4,y,explode_obj) //explode animation appears
if global.demo = false then {score += spider_score;} //add points to the player score
global.spider_points += spider_score
global_game_obj.alarm[5] = 7
global_game_obj.points_amount = (spider_score/300)-1
global_game_obj.points_x = x - 4
global_game_obj.points_y = y +2
global.spiders_killed += 1
global.spider_points += spider_score
instance_destroy(); //destroy self
with (other) instance_destroy();


