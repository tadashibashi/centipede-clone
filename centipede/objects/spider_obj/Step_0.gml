/// @description SPIDER ANIMATION
//animate the sprite
if (!global.all_stop) then
{spider_anim += .5; if direction = 90 or direction = 270 then speed = spd*.75 else speed = spd}
if (global.all_stop) then {speed = 0; gmwPostEvent(global.EV_spider_stop,sound_controller.id); exit;}
if (global.spiders_killed >10) then spd = 5.5;
 else spd = (global.level*.5 + 2);
if (spd > 6) then spd = 6;

if (spider_anim >= 8) then spider_anim = 0 //reset animation when completed

//execute animation
image_index = spider_anim + (global.level-1)*8 //set animation to the right level color

///Potential Scoreable Points
if instance_exists(ship_obj) then ship_distance = (ship_obj.y - y)/8
else ship_distance = 0
if ship_distance > 0 and ship_distance <= 3.5 then spider_score = 900
if ship_distance > 3.5 and ship_distance <= 7 then spider_score = 600
if ship_distance > 7 then spider_score = 300

if change = true then change_dir = ceil(round(random(10))) else change_dir = 0;
if direction = 270 or direction = 315 or direction = 225  then vdir = 2;
if direction = 90 or direction = 135 or direction = 45 then vdir = 1;
//obsolete function: sound_pan(spider_snd,100/room_width*x)

if regular_move = 1
{
switch_dir = ceil(round(random(3)));

if y <= 152
 {
 y = 152
 change = 0;
 change_dir = 0
 alarm[0] = 10;
 if hdir = 1 //Going Left
   {
    if direction = 90
      {
       if switch_dir = 1 then direction = 270;
       if switch_dir = 2 or switch_dir = 3 then direction = 225;
      }
    if direction = 135
     {
      if switch_dir = 1 or switch_dir = 2 then direction = 225;
      if switch_dir = 3 then direction = 270;
     }
   }
 if hdir = 2 //Going Right
   {
   change = 0;
   change_dir = 0;
   alarm[0] = 10;
    if direction = 90
     {
      if switch_dir = 1 then direction = 270;
      if switch_dir = 2 or switch_dir = 3 then direction = 315;
     }
    if direction = 45
     {
      if switch_dir = 1 then direction = 270;
      if switch_dir = 2 or switch_dir = 3 then direction = 315;
     }
   }
 }

if y >= 240 then
{
y = 240
change = 0;
change_dir = 0;
alarm[0] = 10;
  if hdir = 1 //Going Left
   {
    if direction = 270
     {
     if switch_dir = 1 then direction = 90;
     if switch_dir = 2 or switch_dir = 3 then direction = 135;
     }
    if direction = 225
     {
     if switch_dir = 1 then direction = 90;
     if switch_dir = 2 or switch_dir = 3 then direction = 135;
     }
    }
  if hdir = 2 //Going Right
  {
   if direction = 270
    {
     if switch_dir = 1 then direction = 90;
     if switch_dir = 2 or switch_dir = 3 then direction = 45;
    }
   if direction = 315
   {
    if switch_dir = 1 or switch_dir = 2 then direction = 45;
    if switch_dir = 3 then direction = 90;
   }
  }
}

if change_dir = 1
 {
 change = 0;
 change_dir = 0
 alarm[0] = 10;
  if hdir = 1 //Going Left
   {
    if vdir = 1 //Going Up
     {
      if switch_dir = 1 then direction = 225;
      if switch_dir = 2 then direction = 270;
      if switch_dir = 3 then direction = 135;
     }
    if vdir = 2 //Going Down
     {
      if switch_dir = 1 then direction = 135;
      if switch_dir = 2 then direction = 90;
      if switch_dir = 3 then direction = 225;
     }
   }

  if hdir = 2 //Going Right
   {
    if vdir = 1 //Going Up
     {
      if switch_dir = 1 then direction = 315;
      if switch_dir = 2 then direction = 270;
      if switch_dir = 3 then direction = 45;
     }
    if vdir = 2 //Going Down
     {
      if switch_dir = 1 then direction = 45;
      if switch_dir = 2 then direction = 90;
      if switch_dir = 3 then direction = 315;
     }
   }
 }

 }


 //Destroy Spider if it exits the screen
 if hdir = 1 and x < -8 then instance_destroy();
 if hdir = 2 and x > room_width + 8 then instance_destroy();


