#define PI 3.14159265359

float circle(in vec2 _st, in float _radius){
    vec2 l = _st-vec2(0.5);
    return 1.-smoothstep(_radius-(_radius*0.01),
                         _radius+(_radius*0.01),
                         dot(l,l)*4.0);
}

mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle));
}

float box(in vec2 _st, in vec2 _size){
    _size = vec2(0.5) - _size*0.5;
    vec2 uv = smoothstep(_size,
                        _size+vec2(0.001),
                        _st);
    uv *= smoothstep(_size,
                    _size+vec2(0.001),
                    vec2(1.0)-_st);
    return uv.x*uv.y;
}

float cross(in vec2 _st, float _size){
    return  box(_st, vec2(_size,_size/4.)) +
            box(_st, vec2(_size/4.,_size));
}

void main() {
	vec2 st = gl_FragCoord.xy/iResolution.xy;
    vec3 color = vec3(0.0);

    st *= 3.;      // Scale up the space by 3
    float row = floor(st.y);
    float col = floor(st.x);
    st = fract(st); // Wrap arround 1.0

    // Now we have 3 spaces that goes from 0-1

    color = vec3(st,0.0);
    if (row == 1. && col == 1.)
        color = vec3(circle(st,0.5));
    else
    {
        st -= vec2(0.5);
        st = rotate2d(PI/4.) * st;
        st += vec2(0.5);
        color = vec3(cross(st,.5));
    }
	gl_FragColor = vec4(color,1.0);
}