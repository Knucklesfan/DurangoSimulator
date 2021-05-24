///genericdrawfunction(walking,jumping,shooting)
        walking = argument[0];
        jumping = argument[1];
        shooting = argument[2];
        image_speed = 0;
        sprite_index = walking
     
        if(hsp > 0) {
        sprite_index = walking
        image_speed = abs(hsp)/4;
        facing = -1;
        }

        if(hsp < 0) {
        sprite_index = walking
           facing = 1;
           image_speed = abs(hsp)/4;
        }
        if(vsp > 0) {
         image_speed = 0;
                sprite_index = jumping;
                image_index = 1;
        }
        if(vsp < 0) {
         image_speed = 0;
         sprite_index = jumping;
         image_index = 0;
        }
        if(!onground) {
         image_speed = 0;
         sprite_index = jumping;
         image_index = 0;
        }
        
        if(global.flicker mod 2 = 0) {
        draw_sprite_ext(sprite_index,image_index,x,y,facing,image_yscale,image_angle,image_blend,image_alpha);
        }
