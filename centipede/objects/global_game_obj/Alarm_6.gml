//@Begin Spawning Centipede
if (centipede_spawn == false) {
centipede_spawn = true; //begin spawning the centipedes!
cent_spawn_created = 0; //resets the number of centipede created to 0
cent_createx = 0;
gap = 0; //step counter between individual centipede creation to form a chain

//Start Playing Pulse Sound if not in demo mode
if (global.demo == false) {
     gmwPostEvent(global.EV_bgBloop_stop,sound_controller.id);
     gmwPostEvent(global.EV_bgBloop,sound_controller.id);
}

/////Distritues Centipede between connected and individual spawns/////////
   if (global.level == 1) then connected_centipede = 12;
   if (global.level == 2) then connected_centipede = 11;
   if (global.level == 3) then connected_centipede = 11;
   if (global.level == 4) then connected_centipede = 10;
   if (global.level == 5) then connected_centipede = 10;
   if (global.level == 6) then connected_centipede = 9;
   if (global.level == 7) then connected_centipede = 9;
   if (global.level == 8) then connected_centipede = 8;
   if (global.level == 9) then connected_centipede = 8;
   if (global.level == 10) then connected_centipede = 7;
   if (global.level == 11) then connected_centipede = 7;
   if (global.level == 12) then connected_centipede = 6;
   if (global.level == 13) then connected_centipede = 6;
   if (global.level == 14) then connected_centipede = 5;
   if (global.level == 15) then connected_centipede = 5;
   if (global.level == 16) then connected_centipede = 4;
   if (global.level == 17) then connected_centipede = 4;
   if (global.level == 18) then connected_centipede = 3;
   if (global.level == 19) then connected_centipede = 3;
   if (global.level == 20) then connected_centipede = 2;
   if (global.level == 21) then connected_centipede = 2;
   if (global.level >= 22) then connected_centipede = 1;

   //This sets the number individual heads that will come out
   //Total centipedes will always = 12 so the remaining numbers will
   //be individual spawns
   other_centipede = 12 - connected_centipede;

}

