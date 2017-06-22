

//If a Head set the score + 100
//If a regular body part + 10
if (!global.demo) {
     if (head) or (global.cent_justdied == 1) {
          score += 100; global.cent_justdied = 1; global_game_obj.die_counter = 0;
     } else {
           score += 10; global.cent_justdied = 1; global_game_obj.die_counter = 0;
     }
}

//When the centipede dies it will drop a mushroom one column left if going left
//and one column right if going right
if (hdir == 1) then instance_create(abs(x div 8-1)*8,y,mushroom_obj);
if (hdir == 2) then instance_create((x div 8+1)*8,y,mushroom_obj);

//When a super mushroom centipede is destroyed, it leaves behind a temp_mushroom
//object which sobers the centipede as well as the rest of the ones behind.
if (super_mushroom) then instance_create(x,y,temp_mushroom_obj);

global_game_obj.bug_drop -= 1;

with (other) {instance_destroy();}
instance_create(x,y,explode_obj);
instance_destroy();


