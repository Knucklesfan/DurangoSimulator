    attribute vec3 in_Position;
    attribute vec2 in_TextureCoord;
    attribute vec4 in_Colour;
    attribute vec2 in_Normal;  //2d (xy) position of vertex relative to center of star
    varying vec2 v_vTexcoord;
    varying vec4 v_vColour;
    uniform vec4 A;
    //cam_pos is the 2d position (xy) of the camera.
    uniform vec2 cam_pos;
    void main() {
        //first, subtracting cam_pos from the (xy) position of the star's center,
        //...gives it's position relative to the camera.
        //a perspective projection is then applied to P.
        vec2 P = (in_Position.xy - cam_pos) * A.w / in_Position.z;
        //P is wrapped around the origin using modular division:
        //... P0 - floor( p0 * 1/n ) * n - n/2  =  mod( p0, n ) - n/2
        //... A.x = 1/n, A.y = n, A.z = n/2
        //cam_pos is then re-added to P,.
        P += -floor( P * A.x ) * A.y - A.z + cam_pos;
        gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4( P, 0.0, 1.0);
        //add vertex offsets to position of star
        gl_Position.xy += in_Normal;
        v_vColour = in_Colour;
        v_vTexcoord = in_TextureCoord;
    }
//######################_==_YOYO_SHADER_MARKER_==_######################@~    //pass-through
    varying vec2 v_vTexcoord;
    varying vec4 v_vColour;
    void main() {
        gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    }

