//Freezes and resets animations
if (global.all_stop) {
    speed = 0;
    cent_anim = 0; cent_anim2 = 0;
    if (cent_anim >= 7) {
       cent_anim = 0;
    }
    if (cent_anim2 >= 3) {
       cent_anim2 = 0;
    }
    if (sprite_index == cent_forward_spr) or (sprite_index == body_forward_spr) {
       image_index = cent_anim + ((global.level-1)*8);
    }
    if (sprite_index == cent_angle_spr) or (sprite_index == body_angle_spr)
    or (sprite_index == cent_angle_up_spr) or (sprite_index == body_angle_up_spr)
    or (sprite_index == cent_down_spr) or (sprite_index == cent_up_spr)
    or (sprite_index == body_down_spr) or (sprite_index == body_up_spr) {
       image_index = cent_anim2 + ((global.level-1)*4);
    }
}

if (!global.all_stop) {
     //Reset Centipede Animations Before and After Step
    if (cent_anim >= 7) {
        cent_anim = 0;
    }
    if (cent_anim2 >= 3) {
        cent_anim2 = 0;
    }

    if (sprite_index == cent_forward_spr) or (sprite_index == body_forward_spr) {
        image_index = cent_anim + ((global.level-1)*8);
    }
    if (sprite_index == cent_angle_spr) or (sprite_index == body_angle_spr)
    or (sprite_index == cent_angle_up_spr) or (sprite_index == body_angle_up_spr)
    or (sprite_index == cent_down_spr) or (sprite_index == cent_up_spr)
    or (sprite_index == body_down_spr) or (sprite_index == body_up_spr) {
        image_index = cent_anim2 + ((global.level-1)*4);
    }
}

