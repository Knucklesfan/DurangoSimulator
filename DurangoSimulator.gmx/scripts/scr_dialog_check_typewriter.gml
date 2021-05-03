///scr_check_typewriter(text)
var return_val = '';
if(typewriter_active)
{
    if(chars_drawn + string_length(argument0) > typewriter_place)
    {
        var amount = chars_drawn + string_length(argument0) - typewriter_place;
        return_val = string_delete(argument0, string_length(argument0) - amount + 1, amount + 1);
        line_text = '';
        drawtext = '';

        audio_play_sound(obj_dialog.voice,0,false);
    }
    else
    {
        return_val = argument0;
    }
    chars_drawn += string_length(return_val);
    return return_val;
}
else
{
    return argument0;
}

