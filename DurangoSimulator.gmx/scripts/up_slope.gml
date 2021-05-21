/// @function up_slope()
/// @desc This script will tell us how high the slope is.
var dy = 0;
while (place_meeting(x + sign(hspd), y - dy, par_solid)) // While we are not at the top of the slope
{
    dy++;
    if (dy > slope_max) break; // Break if the slope is greater than we can climb
}
return dy;

