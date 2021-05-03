///draw_textbox(str);

strng = argument[0];
str = strng;

var k = 0;
var st = 0;
var nc = 0;
var sh = 0;
var mag = 0;
var c_custom = c_white;
color_pos[st] = 0;
color_type[st] = 0;
var str_tag = "";
var st_tag = 0;

for (var n = 1; n <= string_length(str); n++)
{
    if (string_copy(str, 1, 3) == "[sh")
    ||(string_copy(str, 1, 3) == "[tw")
    {
        if (string_copy(str, 1, 3) == "[sh") sh = 1;
        else if (string_copy(str, 1, 3) == "[tw") sh = 2;
        str = string_delete(str, 1, 8);
        nc += 8;
        
        if !(real(string_copy(strng, 7, 1)) == 0)
        mag = real(string_copy(strng, 7, 1));
    }
    
    if (string_char_at(str, n) == "[")
    {
        str = string_delete(str, n, 1);
        nc += 1;
        color_pos[st] = n;
        
        for (st_tag = n + nc; string_char_at(message[message_current], st_tag) != "]"; st_tag++)
        str_tag = string_insert(string_char_at(message[message_current], st_tag), str_tag, st_tag - (n + nc) + 1);
        
        draw_text(view_xview[0] + 100, view_yview[0] + 100, str_tag);
        
        switch (str_tag)
        {
            case "/c":
                color_type[st] = c_white;
                str = string_delete(str, n, 3);
                nc += 3;
                st += 1;
                break;
                
            case "c_aqua":
                color_type[st] = c_aqua;
                str = string_delete(str, n, 7);
                nc += 7;
                st += 1;
                break;
                
            case "c_black":
                color_type[st] = c_black; 
                str = string_delete(str, n, 8);
                nc += 8;
                st += 1;
                
            case "c_blue":
                color_type[st] = c_blue; 
                str = string_delete(str, n, 7);
                nc += 7;
                st += 1;
                break;
                
            case "c_fuchsia":
                color_type[st] = c_fuchsia;
                str = string_delete(str, n, 10);
                nc += 10;
                st += 1;
                break;
                
            case "c_gray":
                color_type[st] = c_gray;
                str = string_delete(str, n, 7);
                nc += 7;
                st += 1;
                break;
            
            case "c_dkgray":
                color_type[st] = c_dkgray; 
                str = string_delete(str, n, 9);
                nc += 9;
                st += 1;
                break;
                
            case "c_ltgray":
                color_type[st] = c_ltgray;
                str = string_delete(str, n, 9);
                nc += 9;
                st += 1;
                break;
            
            case "c_green":
                color_type[st] = c_green; 
                str = string_delete(str, n, 8);
                nc += 8;
                st += 1;
                break;
            
            case "c_lime":
                color_type[st] = c_lime; 
                str = string_delete(str, n, 7);
                nc += 7;
                st += 1;
                break;
                
            case "c_maroon":
                color_type[st] = c_maroon; 
                str = string_delete(str, n, 9);
                nc += 9;
                st += 1;
                break;
                
            case "c_navy":
                color_type[st] = c_navy;
                str = string_delete(str, n, 7);
                nc += 7;
                st += 1;
                break;
            
            case "c_orange":
                color_type[st] = c_orange; 
                str = string_delete(str, n, 9);
                nc += 9;
                st += 1;
                break;
                
            case "c_purple":
                color_type[st] = c_purple; 
                str = string_delete(str, n, 9);
                nc += 9;
                st += 1;
                break;
            
            case "c_red":
                color_type[st] = c_red; 
                str = string_delete(str, n, 6);
                nc += 6;
                st += 1;
                break;
            
            case "c_silver":
                color_type[st] = c_silver; 
                str = string_delete(str, n, 9);
                nc += 9;
                st += 1;
                break; 
                   
            case "c_teal":
                color_type[st] = c_teal;
                str = string_delete(str, n, 7);
                nc += 7;
                st += 1;
                break;
            
            case "c_yellow":
                color_type[st] = c_yellow; 
                str = string_delete(str, n, 9);
                nc += 9;
                st += 1;
                break;
            
            default:
                if (string_char_at(str_tag, 1) == "$")
                {
                    color_type[st] = make_color_hex(str_tag);
                    if (string_length(str_tag) == 4)
                    {
                        str = string_delete(str, n, 5);
                        nc += 5;
                    }
                    if (string_length(str_tag) == 7)
                    {
                        str = string_delete(str, n, 8);
                        nc += 8;
                    }
                    st += 1;
                    break;
                }
        }
        
        str_tag = "";
    }
}

st = 0;

if (instance_exists(Frisk))
{
    draw_set_font(dt_mono);
    draw_set_color(c_white);
    
    if (Frisk.y < (room_height - 240))
    {
        draw_rectangle(view_xview[0] + 30, view_yview[0] + 320, view_xview[0] + 610, view_yview[0] + 470, false);
        draw_set_color(c_black);
        draw_rectangle(view_xview[0] + 35, view_yview[0] + 325, view_xview[0] + 605, view_yview[0] + 465, false);
        draw_set_color(c_white);
        for (var i = 1; i <= string_length(str); i++)
        {
            message_char_draw = string_copy(str, 1, i);
            
            k += 1;
            if (i == color_pos[st])
            {
                c_custom = color_type[st];
                if (st < array_length_1d(color_type) - 1) st += 1;
            }
            draw_set_color(c_custom);
            
            if (string_char_at(message_char_draw, i) == "#") k = 0;
            message_nl = string_count("#", message_char_draw) * 36;
            
            if (mag == 0)
            {
                draw_text
                (
                    view_xview[0] + 60 + ((k - 3) * 16),
                    view_yview[0] + 339 + message_nl,
                    string_char_at(message_char_draw, i)
                );
            }
            else
            {
                if (sh == 1)
                draw_text
                (
                    view_xview[0] + 60 + ((k - 3) * 16) + random_range(-mag, mag),
                    view_yview[0] + 339 + message_nl + random_range(-mag, mag),
                    string_char_at(message_char_draw, i)
                );
                
                if (sh == 2)
                {
                    var tc = irandom_range(1, 500);
                    
                    if (tc == 1)
                    draw_text
                    (
                        view_xview[0] + 60 + ((k - 3) * 16) + random_range(-mag, mag),
                        view_yview[0] + 339 + message_nl + random_range(-mag, mag),
                        string_char_at(message_char_draw, i)
                    );
                    
                    else draw_text
                    (
                        view_xview[0] + 60 + ((k - 3) * 16),
                        view_yview[0] + 339 + message_nl,
                        string_char_at(message_char_draw, i)
                    );
                }
            }
        }
    }
    else
    {
        draw_rectangle(view_xview[0] + 30, view_yview[0] + 10, view_xview[0] + 610, view_yview[0] + 160, false);
        draw_set_color(c_black);
        draw_rectangle(view_xview[0] + 35, view_yview[0] + 15, view_xview[0] + 605, view_yview[0] + 155, false);
        draw_set_color(c_white);
        for (var i = 1; i <= string_length(str); i++)
        {
            message_char_draw = string_copy(str, 1, i);
            
            k += 1;
            if (i == color_pos[st])
            {
                c_custom = color_type[st];
                if (st < array_length_1d(color_type) - 1) st += 1;
            }
            draw_set_color(c_custom);
            
            if (string_char_at(message_char_draw, i) == "#") k = 0;
            message_nl = string_count("#", message_char_draw) * 36;
            
            if (mag == 0)
            {
                draw_text
                (
                    view_xview[0] + 60 + ((k - 3) * 16),
                    view_yview[0] + 30 + message_nl,
                    string_char_at(message_char_draw, i)
                );
            }
            else
            {
                if (sh == 1)
                draw_text
                (
                    view_xview[0] + 60 + ((k - 3) * 16) + random_range(-mag, mag),
                    view_yview[0] + 30 + message_nl + random_range(-mag, mag),
                    string_char_at(message_char_draw, i)
                );
                
                if (sh == 2)
                {
                    var tc = irandom_range(1, 500);
                    
                    if (tc == 1)
                    draw_text
                    (
                        view_xview[0] + 60 + ((k - 3) * 16) + random_range(-mag, mag),
                        view_yview[0] + 30 + message_nl + random_range(-mag, mag),
                        string_char_at(message_char_draw, i)
                    );
                    
                    else draw_text
                    (
                        view_xview[0] + 60 + ((k - 3) * 16),
                        view_yview[0] + 30 + message_nl,
                        string_char_at(message_char_draw, i)
                    );
                }
            }
        }
    }
}

return 0;
