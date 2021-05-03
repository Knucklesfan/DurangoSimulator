///draw_text_narrator(x, y, str, lt_space);

xx = argument[0];
yy = argument[1];
str = argument[2];
k_len = argument[3];

var k = 0;

draw_set_font(dt_mono);
draw_set_color(c_white);

for (var i = 1; i <= string_length(str); i++)
{
    message_char_draw = string_copy(str, 1, i);
    k += 1;
    if (string_char_at(message_char_draw, i) == "#") k = 0;
    message_nl = string_count("#", message_char_draw) * 36;
    draw_text
    (
        view_xview[0] + xx + ((k - 3) * k_len),
        view_yview[0] + yy + message_nl,
        string_char_at(message_char_draw, i)
    );
}

return 0;
