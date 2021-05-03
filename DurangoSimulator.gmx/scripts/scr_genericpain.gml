///scr_genericpain(player,corpse,hurt)
if(place_meeting(x,y,argument0)) {
if(global.nodeath = false && global.flicker = 0) {
effect_create_above(ef_explosion, x, y, 2, c_orange);
effect_create_above(ef_firework, x, y, 2, c_white);
audio_play_sound(sound11_Explosion_8,0,false);
if(global.hp>1) {
inst = instance_create(x,y-36,argument2);
global.bugdetect = 15;
global.flicker = 120;
global.lasthitx = argument0.x
global.lasthity = argument0.y
}
else {
inst = instance_create(x,y-36,argument1);
}
with inst {
    rotspeed = argument0.hsp * 2;
}
instance_destroy(argument0);
instance_destroy();
}
}
