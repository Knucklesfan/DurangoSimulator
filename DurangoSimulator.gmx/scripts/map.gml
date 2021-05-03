///    @desc map(input, input_start, input_end, output_start, output_end)
///    @arg input
///    @arg input_start
///    @arg input_end
///    @arg output_start
///    @arg output_end

//  Takes an input value, clamped between 2 variables and
//    remaps it to another value between 2 other variables.

var i        = argument0;    //input
var is        = argument1;    //input start
var ie        = argument2;    //input end
var os        = argument3;    //output start
var oe        = argument4;    //output end

var inr = ie - is;
var outr = oe - os;

return (i - is) * outr / inr + os;

