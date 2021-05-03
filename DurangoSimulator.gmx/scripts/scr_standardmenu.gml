switch(selection) {
case 0:
audio_stop_all();
audio_play_sound(sound88_Now__Let_s_Go____Earthbound,0,false);
obj_fader.fadespeed = 0.005;
obj_fader.load = false;
obj_fader.alarm[0] = 1;
break;
case 1:
audio_stop_all();
audio_play_sound(sound88_Now__Let_s_Go____Earthbound,0,false);
obj_fader.fadespeed = 0.005;
obj_fader.load = true;
obj_fader.alarm[0] = 1;
break;
case 2:
break;
case 3:
audio_stop_all();
room_goto(0);
break;
}
