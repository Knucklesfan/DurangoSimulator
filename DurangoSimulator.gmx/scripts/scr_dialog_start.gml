///scr_dialog_start();
obj_dialog.typewriter_speed = obj_dialog.typewriter_speed * (room_speed/30)
obj_dialog.text = dialog[conversation, 0];
obj_dialog.button[0] = dialog[conversation, 1];
obj_dialog.button[1] = dialog[conversation, 2];
obj_dialog.button[2] = dialog[conversation, 3];
obj_dialog.action[0] = dialog[conversation, 4];
obj_dialog.action[1] = dialog[conversation, 5];
obj_dialog.action[2] = dialog[conversation, 6];
obj_dialog.goto[0] = dialog[conversation, 7];
obj_dialog.goto[1] = dialog[conversation, 8];
obj_dialog.goto[2] = dialog[conversation, 9];
obj_dialog.typewriter_active = dialog[conversation, 10];
obj_dialog.npc = id;
global.dialog = 1;
