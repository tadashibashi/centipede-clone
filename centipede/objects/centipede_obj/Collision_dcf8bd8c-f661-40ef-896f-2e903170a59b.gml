//This code will fix the aesthetically weird instance where two
//broken centipedes combine. This will keep them from combining
//by keeping intruding centipedes moving
 if (other.age > age + (8/spd + 2)) or (other.age < age - (8/spd + 2)) {

     if (move_mode == 1) && (hdir == other.hdir) && (other.age > age){
         go_down = true;
     }
     
     if (hdir == other.hdir) then exit;
     if (can_move == false) then exit; //can_move prevents infinite cycling V/^;
     collision_time += 1;
     can_move = false; //trigger off
     alarm[0] = 10; //alarm turns can_move to true



     //MOVE MODE = 2///////////////////
     if (move_mode == 2) {

          if (switch_type == 1) {
               if (switch_step >= 13) {
                    path_set = 1;
                    switch_type = 4;
               }
          }

          if (switch_type == 2) {
               if (switch_step >= 13) {
                    path_set = 1;
                    switch_type = 3;
               }
          }

          if (switch_type == 3) {
               if (switch_step >= 9) {
                    path_set = 1;
                    switch_type = 4;
               }
          }

          if (switch_type == 4) {
               if (switch_step >= 9) {
                    path_set = 1;
                    switch_type = 3;
               }
          }
     }
     //MOVE MODE = 3//////////////////
     if (move_mode == 3) {

          if (switch_type == 1) {
               if (switch_step <= 1) {
                    path_set = 1;
                    switch_type = 4;
               }
          }

          if (switch_type == 2) {
               if (switch_step <= 1) {
                    path_set = 1;
                    switch_type = 3;
               }
          }

          if (switch_type == 3) {
               if (switch_step >= 1) {
                    path_set = 1;
                    switch_type = 4;
               }
          }

          if (switch_type == 4) {
               if (switch_step >= 1) {
                    path_set = 1;
                    switch_type = 3;
               }
          }
     }

 }



