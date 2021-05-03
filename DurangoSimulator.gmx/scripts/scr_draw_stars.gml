//======================================================== 
    shader_set( sh_stars );
    //pass in as uniform "A" (couldn't think of a good name for it)
    //A.x = 1/ length of diagonal of view
    //A.y = length of diagonal of view
    //A.z = length of diagonal of view divided by 2
    //A.w = perspective projection multiple (not sure technical term for this)
    shader_set_uniform_f( shader_get_uniform( sh_stars, "A" ), 1/view_diagonal, view_diagonal, view_diagonal/2, 1/dtan(stars_fov/2) );
    //pass in 2d (xy) position of camera:
    shader_set_uniform_f( shader_get_uniform( sh_stars, "cam_pos" ), view_xview + view_wview/2, view_yview + view_hview/2 );
    //draw stars:
    vertex_submit( vb_stars, pr_trianglelist, tex_stars );
    shader_reset();
//======================================================== 
