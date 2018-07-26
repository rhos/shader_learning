// Author: Patricio Gonzalez Vivo

// Title: Interaction of color - V
// Chapter: Lighter and/or darker - light intensity, lightness
//
// "But this second gradation exist only in our perception.
//  In fact, the vertical bands consist solely of an
//  entirely even middle grey which turns unrecognizable
//  threough a light illusion."
// 															Josef Albers

#ifdef GL_ES
precision mediump float;
#endif

float rect(in vec2 st, in vec2 size){
	size = 0.25*(1.-size);
    vec2 uv = step(size,st*(1.0-st));
	return uv.x*uv.y;
}

void main() {
    vec2 st = gl_FragCoord.xy/iResolution.xy;

    vec3 influenced_color = vec3(0.763,0.580,0.556);
    vec3 influencing_color_A = vec3(0.040,0.040,0.040);
    vec3 influencing_color_B = vec3(0.937,0.981,1.000);
    
    vec3 color = vec3(0.);
    
    // Background Gradient
    color = mix( influencing_color_A,
                 influencing_color_B,
                 st.y);
    
    // Foreground rectangle
    vec2 size = vec2(0.1,0.1);
    vec2 offset = vec2(.3,0.);
    color = mix(color,
               influenced_color,
               rect(st,size));
    
    // color = mix(color,
    //            influenced_color,
    //            rect(st+offset,size));
    
    // color = mix(color,
    //            influenced_color,
    //            rect(st-offset,size));

    gl_FragColor = vec4(color,1.0);
}