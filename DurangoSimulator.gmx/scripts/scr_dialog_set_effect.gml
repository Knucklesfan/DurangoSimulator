///set_effect(command)
var command = argument0;
//shaky text
if(command == '|S|')
{   
    text_shake_counter += 1;
    if(text_shake_counter == text_shake_speed)
    {
        offset_x = view_offset_x + font_padding;
        offset_y = view_offset_y + font_padding;
        text_shake_x = irandom(4) - 2;
        text_shake_y = irandom(4) - 2;
        text_shake_counter = 0;
    }
    offset_x += text_shake_x;
    offset_y += text_shake_y;
}
//ghosty
if(command == '|G|')
{   
    text_shake_counter += 1;
    if(text_shake_counter == text_shake_speed)
    {
        offset_x = view_offset_x + font_padding;
        offset_y = view_offset_y + font_padding;
        text_shake_x = irandom(4) - 2;
        text_shake_y = irandom(4) - 2;
        text_shake_counter = 0;
    }
    offset_x += text_shake_x;
    offset_y += text_shake_y;
    text_ghosting = 1;
}
//normal (non-shaky, non-ghosty, non-coloured)
if(command == '|N|')
{
    offset_x = view_xview[text_box_view] + font_padding;
    offset_y = view_yview[text_box_view] + font_padding;
    text_ghosting = 0;
    draw_set_colour(text_colour);
}
//colours
//red
if(command == '|R|')
{
    draw_set_colour(c_red);
}
//yellow
if(command == '|Y|')
{
    draw_set_colour(c_yellow);
}
//green
if(command == '|U|')
{
    draw_set_colour(c_green);
}
//blue
if(command == '|B|')
{
    draw_set_colour(c_blue);
}
//white
if(command == '|W|')
{
    draw_set_colour(c_white);
}
//black
if(command == '|X|')
{
    draw_set_colour(c_black);
}
if(command == '|D|')
{
    obj_dialog.voice = sound8_durangovoice;
}
if(command == '|C|')
{
    obj_dialog.voice = sound9_knuxvoice;
}
