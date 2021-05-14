#define move_get_collision_list
///move_get_collision_list(obj)

var aabbLeft = min(bbox_left,bbox_left + hspeed);
var aabbRight = max(bbox_right,bbox_right + hspeed);
var aabbTop = min(bbox_top,bbox_top + vspeed) - abs(hspeed);
var aabbBottom = max(bbox_bottom,bbox_bottom + vspeed) + abs(hspeed);
var _list = ds_list_create();
var retId;

with(argument0){
    if(id != other.id){
        retId = collision_rectangle(aabbLeft,aabbTop,aabbRight,aabbBottom,id,false,false);
        if(retId != noone){ ds_list_add(_list,retId); }
    }
}

return _list;

#define area_get_collision_list
///area_get_collision_list(obj)

var _list = ds_list_create();
var retId;

with(argument0){
    if(id != other.id){
        retId = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom+2,id,false,false);
        if(retId != noone){ ds_list_add(_list,retId); }
    }
}

return _list;
