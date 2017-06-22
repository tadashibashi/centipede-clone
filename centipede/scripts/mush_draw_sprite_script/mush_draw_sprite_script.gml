//Draw the super mushroom sprite if super mushroom
//Otherwise draw the regular mushroom sprite if regular
//The forumula for subimage takes the correlating damage and level color in account
if (life >= 1) {
  if (super_mushroom) {
      //draw super_mushroom_spr
    draw_sprite(super_mushroom_spr,(global.level-1)*4 + (4 - life),x,y)
  } else {
      //draw regular mushroom_spr
    draw_sprite(mushroom_spr,(global.level-1)*4 + (4 - life),x,y)
  }
}
