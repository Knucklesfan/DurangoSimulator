///make_color_hex(col, str);
/*
col - represents make_color_rgb based on str
str - integers needed to convert to hex string
*/

str_hxdcml = string_replace(argument[0], "$", "");
var list = "0123456789ABCDEF", cola = 255, colb = 255, colc = 255, i;

for (i = 1; i <= string_length(str_hxdcml); i++)
{
    if (string_count(string_char_at(str_hxdcml, i), list))
    {
        if (string_length(str_hxdcml) == 6)
        {
            global.fid = 6;
            if (i == 1) cola -= string_pos(string_char_at(str_hxdcml, i), list) * 32;
            if (i == 3) colb -= string_pos(string_char_at(str_hxdcml, i), list) * 32;
            if (i == 5) colc -= string_pos(string_char_at(str_hxdcml, i), list) * 32;
            if (i == 2) cola -= string_pos(string_char_at(str_hxdcml, i), list) * (16/5);
            if (i == 4) colb -= string_pos(string_char_at(str_hxdcml, i), list) * (16/5);
            if (i == 6) colc -= string_pos(string_char_at(str_hxdcml, i), list) * (16/5);
        }
        if (string_length(str_hxdcml) == 3)
        {
            global.fid = 3;
            if (i == 1) cola -= string_pos(string_char_at(str_hxdcml, i), list) * 32;
            if (i == 2) colb -= string_pos(string_char_at(str_hxdcml, i), list) * 32;
            if (i == 3) colc -= string_pos(string_char_at(str_hxdcml, i), list) * 32;
        }
    }
}

if (cola < 0) cola = 0;
if (colb < 0) colb = 0;
if (colc < 0) colc = 0;

return make_color_rgb(colc, colb, cola);
