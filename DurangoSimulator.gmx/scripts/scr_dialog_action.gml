///scr_dialog_action()
//does the action as specified in the selected action

var act = string(action[action_selected]);
if(act == 'NEXT' || act == '-1')
{

    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    with(npc) scr_dialog_start();
}
else if(act == 'STOP')
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    npc = -1;
    global.dialog = 0;
}
else if(act == "QUIT")
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    npc.alarm[9] = 1;
    npc = -1;
    global.dialog = 0;
    instance_destroy(npc);
}
else if(act == "ROOM")
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    npc = -1;
    global.dialog = 0;
obj_fader.fadespeed = 0.1;
obj_fader.alarm[0] = 1

}
else if(act == "SURF")
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    npc = -1;
    global.dialog = 0;
    obj_surferintro_durango.alarm[0] = 1;
}
else if(act == "SWIM")
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    npc = -1;
    global.dialog = 0;
    obj_surferoutro_durango.alarm[0] = 1;
}
else if(act == "MAUI")
{

    obj_mauibosscutscene.alarm[0] = 1;
}
else if(act == 'INTENSE')
{

    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
        audio_stop_all();
        audio_play_sound(sound10_cornered,0,true);
    scr_dialog_reset();
    with(npc) scr_dialog_start();
}
else if(act == 'FADE')
{

    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
        audio_sound_gain(sound18_MagnumPI, 0, 2000);
    scr_dialog_reset();
    with(npc) scr_dialog_start();
}
else if(act == 'BATTLE')
{

    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    npc = -1;
    global.dialog = 0;
    obj_durangocutscene.alarm[1] = 10;
}
else if(act == 'BOSS')
{

    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
        audio_stop_all();
    obj_bosshandlerandcutscene.mode = 1;
    audio_play_sound(sound69_fightprequel,0,false);
    scr_dialog_reset();

}
else if(act == 'FIGHTSTART')
{

    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    npc = -1;
    global.dialog = 0;
    obj_bosshandlerandcutscene.mode = 2;
    audio_play_sound(sound70_fightbegins,0,false);
}
else if(act == 'FIGHTCONT')
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    npc = -1;
    global.dialog = 0;
    obj_bosshandlerandcutscene.mode = 3;
    
    
}
else if(act == 'MORPH')
{

    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
        audio_stop_all();
    obj_postdeathmaui.image_speed = 0.1;
    audio_play_sound(sound69_Keyhole___Super_Mario_World,0,false);
    
    scr_dialog_reset();
    
    
}
else if(act == 'ALIENS')
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    obj_ALIENS.alarm[0] = 1;
    with(npc) scr_dialog_start();
}
else if(act == 'ABDUCT')
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    obj_abductionship.alarm[0]=1;
    
    
}
else if(act == 'STUBTOE')
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();

    audio_stop_all();
    audio_play_sound(sound82_Wood_Crash_5_Versions,0,false);
    npc.alpha = 1;
    npc.alarm[0] = 240;
        npc = -1;
    global.dialog = 0;

}
else if(act == 'JOINPARTY')
{

    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
        audio_stop_all();
        audio_play_sound(sound84_Z3vict,0,false);
    scr_dialog_reset();
    with(npc) scr_dialog_start();
}
else if(act == 'ALARMNATOR')
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    npc.alarm[0] = 1;


}
else if(act == 'SHADYJUMP')
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    obj_shadydudedumb.alarm[0] = 1;


}
else if(act == 'ABDUCTLUKE')
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    obj_lukeship.alarm[2] = 1;
        npc = -1;
    global.dialog = 0;

}
else if(act == 'ALARM1')
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    npc.alarm[1] = 1;


}
else if(act == 'DORM')
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    npc.alarm[4] = 1;
        npc = -1;
    global.dialog = 0;

}
else if(act == 'JOHNNYATTACK')
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    obj_cutscenefollower.alarm[0] = 1;


}
else if(act == 'DURANGOSTRIKES')
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    audio_play_sound(sound72_Sound_Effect___Car_alarm,0,false);
    with(npc) scr_dialog_start();

}
else if(act == 'BRICKROAD')
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    obj_brick.alarm[0] = 1;
    with(npc) scr_dialog_start();


}
else if(act == 'EYESOPEN')
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    npc.alarm[1] = 1;


}
else if(act == 'THEFUNNY')
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    inst = instance_create(0,-128,obj_thefunny);
    inst.alarm[0] = 1;
    with(npc) scr_dialog_start();

}
else if(act == 'FALLGUYS')
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    obj_thefunny.alarm[2] = 1;
    with(npc) scr_dialog_start();


}
else if(act == 'ALARM0NOW')
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    npc.alarm[0] = 1;
    with(npc) scr_dialog_start();


}
else if(act == 'ALARM0QUIT')
{
    if(goto[action_selected] == -1)
        npc.conversation += 1;
    else
        npc.conversation = goto[action_selected];
    scr_dialog_reset();
    npc.alarm[0] = 1;
    npc = -1;
    global.dialog = 0;

}
