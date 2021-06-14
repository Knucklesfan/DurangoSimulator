///scr_newplayercontroller
var kright, kleft, kjump, xdir;

kright   = keyboard_check(vk_right);
kleft    = keyboard_check(vk_left);
kjump    = keyboard_check_pressed(ord('X'));
xdir     = keyboard_check(vk_right) - keyboard_check(vk_left);
onground = place_meeting(x, y + 1, par_solid);
krun = keyboard_check(ord('Z'));

// Handle horizontal input
if (xdir != 0)
{
    hsp = approach(hsp, (hsp_max*(1+krun)) * xdir, accel);
}
else
{
    hsp = approach(hsp, 0, fric);
}

// Jump
if (kjump && onground)
{
    vsp = -vsp_max;
}

// Gravity
if (!onground)
{
    vsp = approach(vsp, vsp_max, grav);
}

// Actually move
var dy;
repeat (abs(hsp)) // Horizontal movement
{
   if (onground) // Check for slopes if we are on the ground
   {
        if (place_meeting(x + sign(hsp), y, par_solid)) // Up slope
        {
            dy = up_slope();     // Measure the slope
            if (dy <= slope_max) // Climbable
            {
                x += sign(hsp);
                y -= dy;
                continue;
            }
            hsp = 0; // Unclimbable
            break;
        }
        else if (!place_meeting(x + sign(hsp), y + 1, par_solid)) // Down slope (just like we did up slopes)
        {
            dy = down_slope();        
            if (dy <= slope_max)
            {
                x += sign(hsp);
                y += dy;
                continue;
            }
            x += sign(hsp); // Continue the loop rather than break the loop to keep momentum
            continue;
        }
        else x += sign(hsp); // Flat
    }
    else // We're in the air so we don't check for slopes
    {
        if (!place_meeting(x + sign(hsp), y, par_solid)) x += sign(hsp);
        else
        {
            hsp = 0;
            break;
        }
    }
}
repeat (abs(vsp)) // Vertical movement
{
    if (!place_meeting(x, y + sign(vsp), par_solid)) y += sign(vsp);
    else
    {
        vsp = 0;
        break;
    }
}

//copied straight from the old engine who cares
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

