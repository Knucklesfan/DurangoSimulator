var kright, kleft, kjump, xdir, onground;

kright   = keyboard_check(vk_right);
kleft    = keyboard_check(vk_left);
kjump    = keyboard_check_pressed(ord('X'));
xdir     = keyboard_check(vk_right) - keyboard_check(vk_left);
onground = place_meeting(x, y + 1, par_solid);
krun = keyboard_check(ord('Z'));

// Handle horizontal input
if (xdir != 0)
{
    hspd = approach(hspd, (hspd_max*(1+krun)) * xdir, accel);
}
else
{
    hspd = approach(hspd, 0, fric);
}

// Jump
if (kjump && onground)
{
    vspd = -vspd_max;
}

// Gravity
if (!onground)
{
    vspd = approach(vspd, vspd_max, grav);
}

// Actually move
var dy;
repeat (abs(hspd)) // Horizontal movement
{
   if (onground) // Check for slopes if we are on the ground
   {
        if (place_meeting(x + sign(hspd), y, par_solid)) // Up slope
        {
            dy = up_slope();     // Measure the slope
            if (dy <= slope_max) // Climbable
            {
                x += sign(hspd);
                y -= dy;
                continue;
            }
            hspd = 0; // Unclimbable
            break;
        }
        else if (!place_meeting(x + sign(hspd), y + 1, par_solid)) // Down slope (just like we did up slopes)
        {
            dy = down_slope();        
            if (dy <= slope_max)
            {
                x += sign(hspd);
                y += dy;
                continue;
            }
            x += sign(hspd); // Continue the loop rather than break the loop to keep momentum
            continue;
        }
        else x += sign(hspd); // Flat
    }
    else // We're in the air so we don't check for slopes
    {
        if (!place_meeting(x + sign(hspd), y, par_solid)) x += sign(hspd);
        else
        {
            hspd = 0;
            break;
        }
    }
}
repeat (abs(vspd)) // Vertical movement
{
    if (!place_meeting(x, y + sign(vspd), par_solid)) y += sign(vspd);
    else
    {
        vspd = 0;
        break;
    }
}

