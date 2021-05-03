///scr_toppain(player,corpse,hurt)
if(place_meeting(x,y,argument0)) {
if(global.nodeath = false) {
bullet_ang=point_direction(x,y,argument0.x,argument0.y);
show_debug_message(string(y) + " " + string(argument0.y-36));
if y-36 > argument0.y
{
action_effect(0,0,0,1,16711680, 0);
action_effect(3,0,0,2,16777215,0 );

if bullet_ang > 135 && bullet_ang < 225
{
    speed_ang = -1;
}
else {
    speed_ang = 1;
}
inst = instance_create(x,y, obj_computercorpse);
with(inst) {
    hspeed = 5*other.speed_ang;
}
audio_play_sound(sound11_Explosion_8, 0 ,0);
argument0.vsp -= 20
instance_destroy();
}
else {
scr_genericpain(argument0,argument1,argument2)
}
}
}
