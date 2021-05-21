///Moves the character, regardless of class.
//Work out where to move horizontally
//Get inputs (1 = pressed, 0 = not pressed)
if(global.battlemode = false) {
key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_jump = keyboard_check_pressed(ord("X"));
key_run = keyboard_check(ord("Z"));


if (fire_timer != 0) {
    
    fire_timer --;
    
}
if(global.pause = 0) {
//Work out where to move horizontally
if (key_run) {
    
    hsp = (key_right - key_left) * hsp_run;

} else {
    
    hsp = (key_right - key_left) * hsp_walk;

}

//Work out if we should jump
if (place_meeting(x,y+1,par_solid)) and (key_jump) {

    vsp = vsp_jump; 
    
}
}
}
//Check for horizontal collisions and then move if we can
if place_meeting(x+hsp,y,par_solid) {
    
    if (abs(hsp) >= 1) {
        
        while !place_meeting(x+sign(hsp),y,par_solid) {
            
            x += sign(hsp); 
            
        }
        
    }
    
    //Stop horizontal movement
    hsp = 0;
    
}
//Add the HSPD to X
x += hsp;

if !place_meeting(x,y+1,par_solid) {

    //If you're not touching the ground, add gravity
    vsp += grv;

}

//If you're meeting a solid up or down...
if place_meeting(x,y+vsp,par_solid) {
    
    //While you're at least one pixel inside of the solid in your direction...
    while !place_meeting(x,y+sign(vsp),par_solid) {
        
        //Move out
        y += sign(vsp);
        
    }
    
    //Stop vertical movement
    vsp = 0;
    
}

if place_meeting(x,y+vsp,par_solid) {
    
    //While you're at least one pixel inside of the solid in your direction...
    while !place_meeting(x,y+sign(vsp),par_solid) {
        
        //Move out
        y += sign(vsp);
        
    }
    
    //Stop vertical movement
    vsp = 0;
    
}
//Add the VSPD to Y
y += vsp;
if(place_meeting(x,y,par_solid)) {
    for(var i = 0; i<1000; ++i) {
    //Right
    if(!place_meeting(x+i,y,par_solid)) {
    x+= i;
    }
    //Left
    if(!place_meeting(x-i,y,par_solid)) {
        x-= i;
    }
    //Up
    if(!place_meeting(x,y-i,par_solid)) {
    y-= i;
    }
        if(!place_meeting(x,y+i,par_solid)) {
    y+= i;
    }
    }
}
