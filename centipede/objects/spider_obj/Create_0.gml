//LOCAL VARIABLE INITIATION
spider_anim = 0; //variable for spider subimage animation
spider_score = 0; //when the spider dies, this score is given to player
sprite_index = spider_spr; //the spider sprite is set!
image_speed = 0;
explodex = -4; explodey = 0;
if x < 10 then {hdir = 2; direction = 315}; if x > 200 then {hdir = 1; direction = 225 } //sets direction
vdir = 2;
gmwPostEvent(global.EV_spider_stop,sound_controller.id);
if global.game_mode = 1 then {gmwPostEvent(global.EV_spider,sound_controller.id);}
spd = 2+global.level*.5;
speed = spd;
change = 0;

if speed >= 6 then speed = 6;
alarm[0] = 10;
regular_move = 0;
instance_create(x-4,y,mushroom_eater_obj);


//I hate spiders... both in video games and real life, but its rewarding when you kill them...

