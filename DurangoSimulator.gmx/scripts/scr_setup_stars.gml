//========================================================   
    //number of stars to write to the buffer
    //note:  with 16:9 aspect, about 43% of the stars will be on screen at any time.
    var _num_stars = 4000;
//------------------------------------    
    //fov of perspective used when drawing stars
    //will affect position of star, but not its size.
    stars_fov = 40;  
    //minimum and maximum depth of any star (z distance from "camera", not equal to GM depth value)
    var _min_depth = 10;
    var _max_depth = 200;
    //length of view diagonal plus a little buffer 
    //...calculating view_diagonal will keep stars from wrapping until outside of the view, no matter view rotation.
    view_diagonal = sqrt(view_wview*view_wview+view_wview*view_wview) + 8; 
    //Important note:  If you'd like your view size or fov to change at run-time... 
    //... use the maximum possible values for view_diagonal and fov to calculate _span. 
    var _span = view_diagonal * _max_depth * dtan( stars_fov / 2 );
//------------------------------------
    //sprite and sub-image to use for star
    var _star_sprite = spr_star;  
    var _star_sub_image = 0;
    //texture where sprite sub-image is located
    tex_stars = sprite_get_texture( _star_sprite, _star_sub_image );  
    //texture uv coordinates for this sprite sub-image
    var _uvs = sprite_get_uvs( _star_sprite, _star_sub_image );  
    var _left = _uvs[0];
    var _top = _uvs[1];
    var _right = _uvs[2];
    var _bottom = _uvs[3];
    //size of sprite (note: GM may crop sprite, so can't simply use sprite_get_width or sprite_get_height )
    var _p = ( _right - _left ) / texture_get_texel_width( tex_stars );
    var _q = ( _bottom - _top ) / texture_get_texel_width( tex_stars );
    //vertex position offsets calculated such that stars re always the same size no matter the view size, or the aspect ratio.
    _p /=  view_wport;
    _q /= -view_hport;
//------------------------------------
    //vertex format
    vertex_format_begin();
    vertex_format_add_position_3d();  //3d position of center of star
    vertex_format_add_textcoord();  //texture coordinates of vertex
    vertex_format_add_colour();  //colour and alpha of vertex
    vertex_format_add_custom( vertex_type_float2, vertex_usage_normal );  //2d position of each vertex relative to star center
    vf_stars = vertex_format_end();
//------------------------------------
    //choose some depths for our stars, and sort the depths
    var _depths = ds_priority_create();
    var _z;
    repeat ( _num_stars ) {
        _z = lerp( _min_depth, _max_depth, random( 1 ) );
        ds_priority_add( _depths, _z, _z );
    }
    //------------------------------------
    //create vertex buffer and write stars to it
    vb_stars = vertex_create_buffer();
    vertex_begin( vb_stars, vf_stars );  
    var _x, _y, _colour;
    repeat( _num_stars ) {
        //3d position of center of this star
        _x = random( _span );
        _y = random( _span );
        _z = ds_priority_delete_max( _depths );
        //choose a colour for this star
        _colour = choose( $FFFFFF, $FFD0D0, $D0D0FF );
        //------------------------------------
        //upper-right triangle
            vertex_position_3d( vb_stars, _x, _y, _z );
            vertex_texcoord(    vb_stars, _left, _top );
            vertex_colour(      vb_stars, _colour, 1.0 );
            vertex_float2(      vb_stars, -_p, -_q );
            //------------------------------------
            vertex_position_3d( vb_stars, _x, _y, _z );
            vertex_texcoord(    vb_stars, _right, _top );
            vertex_colour(      vb_stars, _colour, 1.0 );
            vertex_float2(      vb_stars, _p, -_q );     
            //------------------------------------
            vertex_position_3d( vb_stars, _x, _y, _z );
            vertex_texcoord(    vb_stars, _right, _bottom );
            vertex_colour(      vb_stars, _colour, 1.0 );
            vertex_float2(      vb_stars, _p, _q );      
        //------------------------------------
        //bottom-left triangle
            vertex_position_3d( vb_stars, _x, _y, _z );
            vertex_texcoord(    vb_stars, _left, _top );
            vertex_colour(      vb_stars, _colour, 1.0 );
            vertex_float2(      vb_stars, -_p, -_q );   
            //------------------------------------
            vertex_position_3d( vb_stars, _x, _y, _z );
            vertex_texcoord(    vb_stars, _right, _bottom );
            vertex_colour(      vb_stars, _colour, 1.0 );
            vertex_float2(      vb_stars, _p, _q );   
            //------------------------------------
            vertex_position_3d( vb_stars, _x, _y, _z );
            vertex_texcoord(    vb_stars, _left, _bottom );
            vertex_colour(      vb_stars, _colour, 1.0 );
            vertex_float2(      vb_stars, -_p, _q );                          
        //------------------------------------  
    }
    //------------------------------------  
    //cleanup
    ds_priority_destroy( _depths );
    vertex_end( vb_stars );
    vertex_freeze( vb_stars );
//========================================================
