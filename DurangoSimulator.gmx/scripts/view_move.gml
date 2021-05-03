///view_move(view,target,hborder,vborder,respect room boundary)
//René C. Cusumano 2014
var view, target, hbord, vbord, respect;
var left, right, top, bottom;

view = argument[0];
target = argument[1];
hbord = argument[2];
vbord = argument[3];
respect = argument[4];

if (target.sprite_index = -1)
&&(target.mask_index = -1)
{
    left = target.x;
    top = target.y;
    right = left;
    bottom = top;
}
else
{
    left = target.bbox_left;
    top = target.bbox_top;
    right = target.bbox_right;
    bottom = target.bbox_bottom;
}

view_xview[view] = clamp(view_xview[view], right + hbord - view_wview[view], left -hbord);
view_yview[view] = clamp(view_yview[view], bottom + vbord - view_hview[view], top -vbord);

if (respect)
{
    view_xview[view] = clamp(view_xview[view], 0, room_width - view_wview[view]);
    view_yview[view] = clamp(view_yview[view], 0, room_height - view_hview[view]);
}
