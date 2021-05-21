/// @funct down_slope()
/// @desc This script will tell us how low the slope is.
var dy = 0;
while (!place_meeting(x + sign(hspd), y + dy + 1, par_solid)) // While we are not at the bottom of the slope
{
    dy++;
    if (dy > slope_max) break; // Break if the slope is greater than we can climb
}
return dy;

