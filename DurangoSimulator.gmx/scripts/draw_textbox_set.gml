///draw_textbox_set();
if (string_char_at(message[message_current], characters) == "[")
{
    characters += 1;
    voice = 0;
    
    if (string_copy(message[message_current], characters, 3) == "/c]")
    characters += 3;
    
    if (string_copy(message[message_current], characters, 5) == "sh = ")
    ||(string_copy(message[message_current], characters, 5) == "tw = ")
    {
        characters += 7;
    }
    
    if (string_char_at(message[message_current], characters) == "$")
    {
        if (global.fid == 6) characters += 7;
        if (global.fid == 3) characters += 5;
    }
    
    if (string_copy(message[message_current], characters, 6) == "c_red]")
    characters += 6;
    
    if (string_copy(message[message_current], characters, 7) == "c_aqua]")
    ||(string_copy(message[message_current], characters, 7) == "c_blue]")
    ||(string_copy(message[message_current], characters, 7) == "c_gray]")
    ||(string_copy(message[message_current], characters, 7) == "c_lime]")
    ||(string_copy(message[message_current], characters, 7) == "c_navy]")
    ||(string_copy(message[message_current], characters, 7) == "c_teal]")
    characters += 7;
    
    if (string_copy(message[message_current], characters, 8) == "c_black]")
    ||(string_copy(message[message_current], characters, 8) == "c_green]")
    ||(string_copy(message[message_current], characters, 8) == "c_olive]")
    characters += 8;
    
    if (string_copy(message[message_current], characters, 9) == "c_dkgray]")
    ||(string_copy(message[message_current], characters, 9) == "c_ltgray]")
    ||(string_copy(message[message_current], characters, 9) == "c_maroon]")
    ||(string_copy(message[message_current], characters, 9) == "c_orange]")
    ||(string_copy(message[message_current], characters, 9) == "c_purple]")
    ||(string_copy(message[message_current], characters, 9) == "c_silver]")
    ||(string_copy(message[message_current], characters, 9) == "c_yellow]")
    characters += 9;
    
    if (string_copy(message[message_current], characters, 10) == "c_fuchsia]")
    characters += 10;
}

return 0;
