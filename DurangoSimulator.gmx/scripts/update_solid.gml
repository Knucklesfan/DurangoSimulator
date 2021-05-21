#define update_solid
///update_solid(list,direction[,drop])

var _list = argument[0];
var _dir = (round(argument[1]/90)*90) mod 360;
if( _dir < 0 ){ _dir += 360; }
var _i, objID, slope;
if(argument_count>2){
    if(argument[2]){ _dir = 90; }
}

if( _dir == 90 ){

    for( _i = 0; _i < ds_list_size(_list); _i++ ){
        
        objID = ds_list_find_value(_list,_i);
        if(!objID.jumpThru){ continue; }
        objID.solid = false;
    }
} else {

if( _dir == 270 ){

    for( _i = 0; _i < ds_list_size(_list); _i++ ){
        
        objID = ds_list_find_value(_list,_i);
        if(!objID.jumpThru){ continue; }
        if(bbox_bottom > objID.bbox_bottom ){
            objID.solid = false;
            continue;
        }
        if(place_meeting(x,y,objID)){
            objID.solid = false;
            continue;
        }
        
        objID.solid = true;
    }
} else {

    for( _i = 0; _i < ds_list_size(_list); _i++ ){
        
        objID = ds_list_find_value(_list,_i);
        if(!objID.jumpThru){ continue; }
        slope = sign(objID.slope*objID.image_xscale);
        if(slope == 0){
            objID.solid = false;
            continue;
        }
        if(bbox_bottom > objID.bbox_bottom ){
            objID.solid = false;
            continue;
        }
        if(place_meeting(x,y,objID)){
            objID.solid = false;
            continue;
        }
        if(_dir == 0){
            if(slope == 1){
                objID.solid = false;
                continue;
            }
            if(bbox_left > objID.bbox_right){
                objID.solid = false;
                continue;
            }
            
            objID.solid = true;
            
        } else {
            if(slope == -1){
                objID.solid = false;
                continue;
            }
            if(bbox_right < objID.bbox_left){
                objID.solid = false;
                continue;
            }
            
            objID.solid = true;
            
        }
    }
}}

#define reset_solid
///reset_solid(list)

var _list = argument0;
var _i, objID;

for( _i = 0; _i < ds_list_size(_list); _i++ ){
    
    objID = ds_list_find_value(_list,_i);
    if(!objID.jumpThru){ continue; }
    objID.solid = true;
}