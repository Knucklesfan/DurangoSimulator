///draw_textbox_battle_ui(x, y, str);

xx = argument[0];
yy = argument[1];
str = argument[2];

var k = 0;

draw_set_font(dt_mono);

for (var i = 1; i <= string_length(str); i++)
{
    message_char_draw = string_copy(str, 1, i);
    k += 1;
    if (string_char_at(message_char_draw, i) == "#") k = 0;
    message_nl = string_count("#", message_char_draw) * 36;
    
    var tc = irandom_range(1, 500);
                    
    if (tc = 1)
    draw_text
    (
        view_xview[0] + xx + ((k - 1) * 16) + random_range(-2, 2),
        view_yview[0] + yy + message_nl + random_range(-2, 2),
        string_char_at(message_char_draw, i)
    );
    
    else draw_text
    (
        view_xview[0] + xx + ((k - 1) * 16),
        view_yview[0] + yy + message_nl,
        string_char_at(message_char_draw, i)
    );
}

return 0;
