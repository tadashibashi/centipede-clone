if global.game_mode != 3 then instance_destroy();
if collision_point(x,8,mushroom_indicator_obj,true,false)
{
 instance_destroy(); instance_create(x,y,need_heal_obj2)
}


